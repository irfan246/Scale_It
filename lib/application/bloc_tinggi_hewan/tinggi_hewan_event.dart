part of 'tinggi_hewan_bloc.dart';

abstract class TinggiHewanEvent {}

class StartTinggiHewanEvent extends TinggiHewanEvent {}

class AnswerTinggiHewanEvent extends TinggiHewanEvent {
  final String answer;

  AnswerTinggiHewanEvent(this.answer);
}

class ResetTinggiHewanEvent extends TinggiHewanEvent {}
