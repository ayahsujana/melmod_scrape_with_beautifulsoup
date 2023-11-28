import 'package:blocwithgetit/core.dart';
import 'package:blocwithgetit/model/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadMelmodButton extends StatelessWidget {
  DownloadMelmodButton(
      {required this.melmod, required this.controller, super.key});
  final DetailMelmodModel melmod;
  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    String fileName = melmod.title.replaceAll(RegExp('[^A-Za-z0-9]'), '');
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.all(4),
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
              onPressed: () => controller.getDownloadMelmod(
                  url: melmod.zipUrl, fileName: fileName),
              child: Text("DOWNLOAD",
                  style: GoogleFonts.cousine(
                      fontSize: 16, fontWeight: FontWeight.bold)))),
    );
  }
}
