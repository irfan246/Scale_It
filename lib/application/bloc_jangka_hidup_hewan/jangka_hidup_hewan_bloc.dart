import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/model/jangka_hidup_hewan.dart';
import '../../infrastructure/jangka_hidup_hewan/highscore_database.dart';

part 'jangka_hidup_hewan_event.dart';
part 'jangka_hidup_hewan_state.dart';

class JangkaHidupHewanBloc
    extends Bloc<JangkaHidupHewanEvent, JangkaHidupHewanState> {
  final List<JangkaHidupHewan> jangkaHidupHewan;
  final JangkaHidupHewanHighScoreDatabase database;
  final Random random = Random();

  JangkaHidupHewanBloc(this.jangkaHidupHewan, this.database)
      : super(JangkaHidupHewanInitial()) {
    on<StartJangkaHidupHewanEvent>((event, emit) {
      _generateNewRound(emit, 0);
    });

    on<AnswerJangkaHidupHewanEvent>((event, emit) async {
      if (state is JangkaHidupHewanLoaded) {
        final currentState = state as JangkaHidupHewanLoaded;
        final isCorrect = _checkAnswer(
          event.answer,
          currentState.questionJangkaHidupHewan.year,
          currentState.referenceJangkaHidupHewan.year,
        );

        if (isCorrect) {
          final borderColor = event.answer == 'panjang'
              ? const Color(0xFFC04159)
              : const Color(0xFF1C7CC5);
          emit(currentState.copyWith(
              showCorrectIndicator: true, borderColor: borderColor));
          await Future.delayed(const Duration(seconds: 1));
          _generateNewRound(emit, currentState.score + 1);
        } else {
          emit(currentState.copyWith(borderColor: Colors.black));
          // Simpan skor akhir ke database menggunakan metode addScore
          await database.addScore('jangka_hidup_hewan', currentState.score);

          emit(JangkaHidupHewanGameOver(finalScore: currentState.score));
        }
      }
    });

    on<ResetJangkaHidupHewanEvent>((event, emit) {
      _generateNewRound(emit, 0); // Reset game with score 0
    });
  }

  void _generateNewRound(Emitter<JangkaHidupHewanState> emit, int score) {
    JangkaHidupHewan questionJangkaHidupHewan =
        jangkaHidupHewan[random.nextInt(jangkaHidupHewan.length)];
    JangkaHidupHewan referenceJangkaHidupHewan;

    do {
      referenceJangkaHidupHewan =
          jangkaHidupHewan[random.nextInt(jangkaHidupHewan.length)];
    } while (referenceJangkaHidupHewan.name == questionJangkaHidupHewan.name);

    // Acak widget mana yang menjadi Question dan Reference
    bool isWidget1Question = random.nextBool();

    emit(JangkaHidupHewanLoaded(
      score: score,
      questionJangkaHidupHewan: questionJangkaHidupHewan,
      referenceJangkaHidupHewan: referenceJangkaHidupHewan,
      isWidget1Question:
          isWidget1Question, // True jika Widget 1 adalah Question
    ));
  }

  bool _checkAnswer(String answer, int questionHeight, int referenceHeight) {
    if (answer == 'panjang') {
      return questionHeight > referenceHeight;
    } else if (answer == 'pendek') {
      return questionHeight < referenceHeight;
    }
    return false;
  }
}
