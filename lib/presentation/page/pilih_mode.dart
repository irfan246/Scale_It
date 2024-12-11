import 'package:flutter/material.dart';

class PilihMode extends StatelessWidget {
  const PilihMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {},
            icon:
                const Image(image: AssetImage('assets/images/arrow_back.png'))),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
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
              children: [
                ElevatedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
                            image: AssetImage('assets/images/icon_sejarah.png'),
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
      ),
    );
  }
}
