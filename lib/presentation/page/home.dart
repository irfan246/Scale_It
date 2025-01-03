import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/logo.png'),
                width: screenWidth * 0.2150573,
                height: screenHeight * 0.38316,
              ),
              SizedBox(
                height: screenHeight * 0.0285,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pilihMode');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(screenWidth * 0.1625, screenHeight * 0.1334),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.01823))),
                child: Center(
                  child: Image(
                    image: const AssetImage('assets/images/play.png'),
                    width: screenWidth * 0.0522,
                    height: screenHeight * 0.09463,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
