part of 'jangka_hidup_hewan_bloc.dart';

abstract class JangkaHidupHewanEvent {}

class StartJangkaHidupHewanEvent extends JangkaHidupHewanEvent {}

class AnswerJangkaHidupHewanEvent extends JangkaHidupHewanEvent {
  final String answer;

  AnswerJangkaHidupHewanEvent(this.answer);
}

class ResetJangkaHidupHewanEvent extends JangkaHidupHewanEvent {}
