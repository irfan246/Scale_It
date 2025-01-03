part of 'tinggi_hewan_bloc.dart';

abstract class TinggiHewanState {}

class TinggiHewanInitial extends TinggiHewanState {}

class TinggiHewanLoaded extends TinggiHewanState {
  final int score;
  final TinggiHewan questionAnimal;
  final TinggiHewan referenceAnimal;
  final bool isWidget1Question;
  final bool showCorrectIndicator;
  final Color borderColor;

  TinggiHewanLoaded({
    required this.score,
    required this.questionAnimal,
    required this.referenceAnimal,
    required this.isWidget1Question,
    this.showCorrectIndicator = false,
    this.borderColor = Colors.black,
  });

  TinggiHewanLoaded copyWith({
    int? score,
    TinggiHewan? questionAnimal,
    TinggiHewan? referenceAnimal,
    bool? isWidget1Question,
    bool? showCorrectIndicator,
    Color? borderColor,
  }) {
    return TinggiHewanLoaded(
      score: score ?? this.score,
      questionAnimal: questionAnimal ?? this.questionAnimal,
      referenceAnimal: referenceAnimal ?? this.referenceAnimal,
      isWidget1Question: isWidget1Question ?? this.isWidget1Question,
      showCorrectIndicator: showCorrectIndicator ?? this.showCorrectIndicator,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

class TinggiHewanGameOver extends TinggiHewanState {
  final int finalScore;

  TinggiHewanGameOver({required this.finalScore});
}
