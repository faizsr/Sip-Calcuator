import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
import 'package:sip_calculator/core/constants/apptextstyles.dart';
import 'package:sip_calculator/core/constants/stoks_icons.dart';
import 'package:sip_calculator/core/utils/decoration.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                StoksIcon.diagram,
                color: AppColors.lDarkPurple,
                size: 30,
              ),
              Text('STOKS', style: AppTextStyles.heading),
            ],
          ),
          const Spacer(),
          Container(
            decoration: kDecoration(borderRadius: 50),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              'Sip Calculator',
              style: AppTextStyles.main,
            ),
          ),
        ],
      ),
    );
  }
}
