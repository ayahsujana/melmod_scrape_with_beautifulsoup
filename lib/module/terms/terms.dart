import 'package:blocwithgetit/Util/Constant/about_notice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms of Use",
            style: GoogleFonts.cousine(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            terms,
            style: GoogleFonts.cousine(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
