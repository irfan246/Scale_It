import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/model/waktu_sejarah.dart';
import '../../infrastructure/waktu_sejarah/highscore_database.dart';

part 'waktu_sejarah_event.dart';
part 'waktu_sejarah_state.dart';

class WaktuSejarahBloc extends Bloc<WaktuSejarahEvent, WaktuSejarahState> {
  final List<WaktuSejarah> waktuSejarah;
  final WaktuSejarahHighScoreDatabase database;
  final Random random = Random();

  WaktuSejarahBloc(this.waktuSejarah, this.database)
      : super(WaktuSejarahInitial()) {
    on<StartWaktuSejarahEvent>((event, emit) {
      _generateNewRound(emit, 0);
    });

    on<AnswerWaktuSejarahEvent>((event, emit) async {
      if (state is WaktuSejarahLoaded) {
        final currentState = state as WaktuSejarahLoaded;
        final isCorrect = _checkAnswer(
          event.answer,
          currentState.questionWaktuSejarah.year,
          currentState.referenceWaktuSejarah.year,
        );

        if (isCorrect) {
          final borderColor = event.answer == 'dahulu'
              ? const Color(0xFFC04159)
              : const Color(0xFF1C7CC5);
          emit(currentState.copyWith(
              showCorrectIndicator: true, borderColor: borderColor));
          await Future.delayed(const Duration(seconds: 1));
          _generateNewRound(emit, currentState.score + 1);
        } else {
          emit(currentState.copyWith(borderColor: Colors.black));
          // Simpan skor akhir ke database menggunakan metode addScore
          await database.addScore('waktu_sejarah', currentState.score);

          emit(WaktuSejarahGameOver(finalScore: currentState.score));
        }
      }
    });

    on<ResetWaktuSejarahEvent>((event, emit) {
      _generateNewRound(emit, 0); // Reset game with score 0
    });
  }

  void _generateNewRound(Emitter<WaktuSejarahState> emit, int score) {
    WaktuSejarah questionWaktuSejarah =
        waktuSejarah[random.nextInt(waktuSejarah.length)];
    WaktuSejarah referenceWaktuSejarah;

    do {
      referenceWaktuSejarah = waktuSejarah[random.nextInt(waktuSejarah.length)];
    } while (referenceWaktuSejarah.name == questionWaktuSejarah.name);

    // Acak widget mana yang menjadi Question dan Reference
    bool isWidget1Question = random.nextBool();

    emit(WaktuSejarahLoaded(
      score: score,
      questionWaktuSejarah: questionWaktuSejarah,
      referenceWaktuSejarah: referenceWaktuSejarah,
      isWidget1Question:
          isWidget1Question, // True jika Widget 1 adalah Question
    ));
  }

  bool _checkAnswer(String answer, int questionHeight, int referenceHeight) {
    if (answer == 'dahulu') {
      return questionHeight < referenceHeight;
    } else if (answer == 'baru') {
      return questionHeight > referenceHeight;
    }
    return false;
  }
}
