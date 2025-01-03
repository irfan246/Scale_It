part of 'waktu_sejarah_bloc.dart';

abstract class WaktuSejarahState {}

class WaktuSejarahInitial extends WaktuSejarahState {}

class WaktuSejarahLoaded extends WaktuSejarahState {
  final int score;
  final WaktuSejarah questionWaktuSejarah;
  final WaktuSejarah referenceWaktuSejarah;
  final bool isWidget1Question;
  final bool showCorrectIndicator;
  final Color borderColor;

  WaktuSejarahLoaded({
    required this.score,
    required this.questionWaktuSejarah,
    required this.referenceWaktuSejarah,
    required this.isWidget1Question,
    this.showCorrectIndicator = false,
    this.borderColor = Colors.black,
  });

  WaktuSejarahLoaded copyWith({
    int? score,
    WaktuSejarah? questionAnimal,
    WaktuSejarah? referenceAnimal,
    bool? isWidget1Question,
    bool? showCorrectIndicator,
    Color? borderColor,
  }) {
    return WaktuSejarahLoaded(
      score: score ?? this.score,
      questionWaktuSejarah: questionAnimal ?? questionWaktuSejarah,
      referenceWaktuSejarah: referenceAnimal ?? referenceWaktuSejarah,
      isWidget1Question: isWidget1Question ?? this.isWidget1Question,
      showCorrectIndicator: showCorrectIndicator ?? this.showCorrectIndicator,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

class WaktuSejarahGameOver extends WaktuSejarahState {
  final int finalScore;

  WaktuSejarahGameOver({required this.finalScore});
}
