// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocwithgetit/Util/Constant/app_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ShareMelmodButton extends StatelessWidget {
  const ShareMelmodButton({
    Key? key,
    required this.melmod,
  }) : super(key: key);
  final String melmod;

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
        onPressed: () => Share.share(
          'Mod $melmod • Download now on play store free without ads $urlPS$packageName',
          subject: 'Mod $melmod',
        ),
        child: Text("Share To",
            style:
                GoogleFonts.cousine(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
