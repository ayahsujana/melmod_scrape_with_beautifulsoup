import 'package:blocwithgetit/Util/Constant/how_install.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToInstall extends StatelessWidget {
  const HowToInstall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Install Melmod',
          style: GoogleFonts.cousine(fontWeight: FontWeight.bold),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                howToTitle,
                style: GoogleFonts.cousine(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
              height: 10.0,
              ),
              Text(howToDesc, style: GoogleFonts.cousine(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
