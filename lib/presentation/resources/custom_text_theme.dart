import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:measure_ap/presentation/resources/color_manager.dart';

TextStyle customTextStyle({
  double fontSize = 12.0,
  FontWeight fontWeight = FontWeight.w400,
  Color? color,
  double? ls,
}) {
  return GoogleFonts.manrope(
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: ls,
    color: color ?? ColorManager.dark,
  );
}
