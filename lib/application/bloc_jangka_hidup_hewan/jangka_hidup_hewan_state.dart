part of 'jangka_hidup_hewan_bloc.dart';

abstract class JangkaHidupHewanState {}

class JangkaHidupHewanInitial extends JangkaHidupHewanState {}

class JangkaHidupHewanLoaded extends JangkaHidupHewanState {
  final int score;
  final JangkaHidupHewan questionJangkaHidupHewan;
  final JangkaHidupHewan referenceJangkaHidupHewan;
  final bool isWidget1Question;
  final bool showCorrectIndicator;
  final Color borderColor;

  JangkaHidupHewanLoaded({
    required this.score,
    required this.questionJangkaHidupHewan,
    required this.referenceJangkaHidupHewan,
    required this.isWidget1Question,
    this.showCorrectIndicator = false,
    this.borderColor = Colors.black,
  });

  JangkaHidupHewanLoaded copyWith({
    int? score,
    JangkaHidupHewan? questionAnimal,
    JangkaHidupHewan? referenceAnimal,
    bool? isWidget1Question,
    bool? showCorrectIndicator,
    Color? borderColor,
  }) {
    return JangkaHidupHewanLoaded(
      score: score ?? this.score,
      questionJangkaHidupHewan: questionAnimal ?? questionJangkaHidupHewan,
      referenceJangkaHidupHewan: referenceAnimal ?? referenceJangkaHidupHewan,
      isWidget1Question: isWidget1Question ?? this.isWidget1Question,
      showCorrectIndicator: showCorrectIndicator ?? this.showCorrectIndicator,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

class JangkaHidupHewanGameOver extends JangkaHidupHewanState {
  final int finalScore;

  JangkaHidupHewanGameOver({required this.finalScore});
}
