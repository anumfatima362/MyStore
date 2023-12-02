import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/utils/constants/colors.dart';

Widget mtext(
  String text,
) {
  return Text(text,
      style: GoogleFonts.playfairDisplay(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ));
}

Widget ctext() {
  return Text(
    '234 results found',
    style: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.grey,
    ),
  );
}
