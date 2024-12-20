import 'package:flutter/material.dart';

class CanvasScreen extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CanvasScreen({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            onPressed: onTap,
            icon: const Image(
              image: AssetImage('assets/images/arrow_back.png'),
              width: 70.79,
              height: 31,
            )),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          child
        ],
      ),
    );
  }
}
