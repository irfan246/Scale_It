import 'package:flutter/material.dart';

class CanvasScreen extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CanvasScreen({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            padding: EdgeInsets.only(left: screenWidth * 0.0104166),
            onPressed: onTap,
            icon: Image(
              image: const AssetImage('assets/images/arrow_back.png'),
              width: screenWidth * 0.03687,
              height: screenHeight * 0.02934,
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
