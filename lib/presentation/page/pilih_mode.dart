import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scale_it/presentation/widget/canvas.dart';

class PilihMode extends StatelessWidget {
  const PilihMode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CanvasScreen(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: screenWidth * 0.3698,
              top: screenHeight * 0.09463,
              child: Text(
                'Pilih Mode !',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'AvantGarde_CE_Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.4166,
              top: screenHeight * 0.4730369,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        final random = Random();
                        final route = random.nextBool()
                            ? '/tinggiHewan'
                            : '/jangkaHidupHewan';
                        Navigator.pushNamed(context, route);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            screenWidth * 0.191666, screenHeight * 0.1116373),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.0078125),
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/images/icon_hewan.png'),
                                width: screenWidth * 0.031148,
                                height: screenHeight * 0.075667,
                              ),
                              SizedBox(
                                width: screenWidth * 0.005625,
                              ),
                              Text(
                                'Hewan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: screenWidth * 0.0255,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: screenHeight * 0.0285,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/waktuSejarah');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            screenWidth * 0.191666, screenHeight * 0.1116373),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.0078125),
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/images/icon_sejarah.png'),
                                width: screenWidth * 0.021148,
                                height: screenHeight * 0.065667,
                              ),
                              SizedBox(
                                width: screenWidth * 0.007625,
                              ),
                              Text(
                                'Sejarah',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: screenWidth * 0.0255,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
