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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                    width: screenWidth * 0.002604166,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )),
              child: Image.asset(
                name.imagePath,
                width: screenWidth * 0.12,
                height: screenHeight * 0.2176,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.00522,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.2604166,
                  child: Text(
                    name.name,
                    style: TextStyle(
                      fontFamily: 'AvantGarde_CE_Bold',
                      fontSize: screenWidth * 0.0333,
                    ),
                  ),
                ),
                Text(
                  subText,
                  style: TextStyle(
                    fontFamily: 'AvantGarde_CE_Regular',
                    fontSize: screenWidth * 0.01875,
                  ),
                ),
              ],
            )
          ],
        ),
        if (isCorrect && showCorrectIndicator)
          Positioned(
              left: screenWidth * 0.099,
              bottom: screenHeight * 0.146641,
              child: Image(
                image: const AssetImage('assets/images/icon_benar.png'),
                width: screenWidth * 0.053125,
                height: screenHeight * 0.0681173,
              ))
      ],
    );
  }
}
