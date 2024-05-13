import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.endPercent,
  });

  final double endPercent;

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: endPercent),
        duration: const Duration(milliseconds: 3500),
        builder: (context, value, child) {
          return SizedBox(
            height: 160,
            width: 160,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: AppColors.lLightYellow,
              strokeWidth: 35,
              strokeAlign: -1,
              valueColor: AlwaysStoppedAnimation(AppColors.lDarkPurple),
            ),
          );
        },
      ),
    );
  }
}
