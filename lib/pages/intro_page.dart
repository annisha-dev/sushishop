import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi.png'),
            ),

            // Title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Feel the taste of the most popular japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),
            const SizedBox(height: 25),

            // Get started button
            MyButton(
              text: "Get started",
              onTap: () {
                // go to the menu page
                Navigator.pushNamed(context, '/menupage');
              },
              )

          ],
        ),
      ),
    );
  }
}
