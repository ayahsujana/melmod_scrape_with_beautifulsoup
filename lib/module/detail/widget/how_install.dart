import 'package:blocwithgetit/module/howto.dart/how_to_install.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../state_util.dart';

class HowToInstallMelmod extends StatelessWidget {
  const HowToInstallMelmod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.green,
          side: const BorderSide(
            color: Colors.green,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => Get.to(HowToInstall()),
        child: Text("How To Install",
            style:
                GoogleFonts.cousine(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
