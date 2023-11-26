import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
    this.title, {
    super.key,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  });
  final String? title;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(title!,
        overflow: overflow, maxLines: maxLines, style: GoogleFonts.cousine());
  }
}
