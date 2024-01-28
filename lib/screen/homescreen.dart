import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman/screen/levelscreen.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/homescreen.jpg',
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 35,
              top: 350,
              child: Column(
                children: [
                  Text(
                    'Hang_an',
                    style: GoogleFonts.kalam(
                        textStyle: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'You have only 4 lives',
                    style: GoogleFonts.kalam(
                        textStyle: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Text(
                    '(Unless you are a cat)',
                    style: GoogleFonts.kalam(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 150,
              top: 630,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return levelscreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                label: Text(
                  'Play',
                  style: GoogleFonts.kalam(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
