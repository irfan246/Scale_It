import 'package:flutter/material.dart';

class Pertanyaan extends StatelessWidget {
  final name;
  final String subText;
  final bool isCorrect;
  final bool showCorrectIndicator;
  final Color borderColor;

  const Pertanyaan({
    super.key,
    required this.name,
    required this.subText,
    required this.isCorrect,
    required this.showCorrectIndicator,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  border: Border.all(
                    color: borderColor,
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )),
              child: Image.asset(
                name.imagePath,
                width: 230,
                height: 230,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 500,
                  child: Text(
                    name.name,
                    style: const TextStyle(
                      fontFamily: 'AvantGarde_CE_Bold',
                      fontSize: 64,
                    ),
                  ),
                ),
                Text(
                  subText,
                  style: const TextStyle(
                    fontFamily: 'AvantGarde_CE_Regular',
                    fontSize: 36,
                  ),
                ),
              ],
            )
          ],
        ),
        if (isCorrect && showCorrectIndicator)
          const Positioned(
              left: 190,
              bottom: 155,
              child: Image(
                image: AssetImage('assets/images/icon_benar.png'),
              ))
      ],
    );
  }
}
