// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocwithgetit/Util/capitalize.dart';
import 'package:flutter/material.dart';

import 'package:blocwithgetit/model/melmod.dart';
import 'package:google_fonts/google_fonts.dart';

class MelmodContent extends StatelessWidget {
  const MelmodContent({
    Key? key,
    required this.melmod,
  }) : super(key: key);
  final MelModModel melmod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 160,
        height: 200,
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              melmod.image,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          color: Colors.blue[400],
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12.0,
                  ),
                ),
              ),
              child: Text(
                melmod.create,
                style: GoogleFonts.cousine(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                child: Text(
                  melmod.title.replaceAll('&nbsp;', '').capitalize(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cousine(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
