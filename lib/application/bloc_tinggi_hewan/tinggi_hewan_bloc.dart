import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scale_it/infrastructure/tinggi_hewan/highscore_database.dart';

import '../../domain/model/tinggi_hewan.dart';

part 'tinggi_hewan_event.dart';
part 'tinggi_hewan_state.dart';

class TinggiHewanBloc extends Bloc<TinggiHewanEvent, TinggiHewanState> {
  final List<TinggiHewan> animals;
  final TinggiHewanHighScoreDatabase database;
  final Random random = Random();

  TinggiHewanBloc(this.animals, this.database) : super(TinggiHewanInitial()) {
    on<StartTinggiHewanEvent>((event, emit) {
      _generateNewRound(emit, 0);
    });

    on<AnswerTinggiHewanEvent>((event, emit) async {
      if (state is TinggiHewanLoaded) {
        final currentState = state as TinggiHewanLoaded;
        final isCorrect = _checkAnswer(
          event.answer,
          currentState.questionAnimal.height,
          currentState.referenceAnimal.height,
        );

        if (isCorrect) {
          final borderColor = event.answer == 'tinggi'
              ? const Color(0xFFC04159)
              : const Color(0xFF1C7CC5);
          emit(currentState.copyWith(
              showCorrectIndicator: true, borderColor: borderColor));
          await Future.delayed(const Duration(seconds: 1));
          _generateNewRound(emit, currentState.score + 1);
        } else {
          // Simpan skor akhir ke database menggunakan metode addScore
          await database.addScore('tinggi_hewan', currentState.score);
          emit(currentState.copyWith(borderColor: Colors.black));
          emit(TinggiHewanGameOver(finalScore: currentState.score));
        }
      }
    });

    on<ResetTinggiHewanEvent>((event, emit) {
      _generateNewRound(emit, 0); // Reset game with score 0
    });
  }

  void _generateNewRound(Emitter<TinggiHewanState> emit, int score) {
    TinggiHewan questionAnimal = animals[random.nextInt(animals.length)];
    TinggiHewan referenceAnimal;

    do {
      referenceAnimal = animals[random.nextInt(animals.length)];
    } while (referenceAnimal.name == questionAnimal.name);

    // Acak widget mana yang menjadi Question dan Reference
    bool isWidget1Question = random.nextBool();

    emit(TinggiHewanLoaded(
      score: score,
      questionAnimal: questionAnimal,
      referenceAnimal: referenceAnimal,
      isWidget1Question:
          isWidget1Question, // True jika Widget 1 adalah Question
    ));
  }

  bool _checkAnswer(String answer, int questionHeight, int referenceHeight) {
    if (answer == 'tinggi') {
      return questionHeight > referenceHeight;
    } else if (answer == 'rendah') {
      return questionHeight < referenceHeight;
    }
    return false;
  }
}
