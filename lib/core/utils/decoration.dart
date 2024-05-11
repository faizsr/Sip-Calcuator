import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/colors.dart';

Decoration kDecoration({required double borderRadius}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: lWhite,
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
