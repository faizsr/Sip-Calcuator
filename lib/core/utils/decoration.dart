import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';

Decoration kDecoration({required double borderRadius}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: AppColors.lWhite,
    boxShadow: const [
      BoxShadow(
        color: Color(0x0D000000),
        offset: Offset(1, 2),
        blurRadius: 8.0,
        spreadRadius: 0.0,
      )
    ],
  );
}

TextStyle kTextStyle = TextStyle(
  fontSize: 12,
  color: AppColors.lGray,
);
