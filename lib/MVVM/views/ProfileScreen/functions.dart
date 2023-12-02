import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/utils/constants/colors.dart';

class FunctionWidget extends StatelessWidget {
  String text;
  final String svgPath;

  FunctionWidget({super.key, required this.text, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        ),
        SvgPicture.asset(
          svgPath,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.dark),
        ),
      ],
    );
  }
}
