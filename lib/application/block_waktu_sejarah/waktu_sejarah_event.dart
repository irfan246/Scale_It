part of 'waktu_sejarah_bloc.dart';

abstract class WaktuSejarahEvent {}

class StartWaktuSejarahEvent extends WaktuSejarahEvent {}

class AnswerWaktuSejarahEvent extends WaktuSejarahEvent {
  final String answer;

  AnswerWaktuSejarahEvent(this.answer);
}

class ResetWaktuSejarahEvent extends WaktuSejarahEvent {}
