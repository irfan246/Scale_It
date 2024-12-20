import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scale_it/presentation/widget/canvas.dart';

class PilihMode extends StatelessWidget {
  const PilihMode({super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasScreen(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: <Widget>[
            const Positioned(
              left: 710,
              top: 100,
              child: Text(
                'Pilih Mode !',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'AvantGarde_CE_Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 96,
                ),
              ),
            ),
            Positioned(
              left: 800,
              top: 500,
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
                          fixedSize: const Size(368, 118),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/icon_hewan.png'),
                              width: 79,
                              height: 90.55,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Hewan',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AvantGarde_CE_Bold',
                                fontSize: 48,
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/waktuSejarah');
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(368, 118),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/icon_sejarah.png'),
                              width: 79,
                              height: 90.55,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Sejarah',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AvantGarde_CE_Bold',
                                fontSize: 48,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
