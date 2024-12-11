import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 412.91,
                height: 405,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pilihMode');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(312, 141),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35))),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/images/play.png'),
                    width: 100,
                    height: 100,
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
