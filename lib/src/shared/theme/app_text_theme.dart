import 'package:app_qlorian/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final title = GoogleFonts.nunitoSans(
    color: AppColors.titleColor,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    letterSpacing: 0.15,
  );
  static final subtitle = GoogleFonts.nunito(
    color: AppColors.subtitleColor,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.1,
  );
  static final fildeName = GoogleFonts.nunito(
    color: AppColors.titleColor,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.1,
  );
  static final textButton = GoogleFonts.nunito(
    color: AppColors.backgroundColor,
    fontWeight: FontWeight.w500,
    fontSize: 21,
    letterSpacing: 0.15,
  );
}
