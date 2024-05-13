import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/constants/apptextstyles.dart';
import 'package:sip_calculator/core/utils/decoration.dart';
import 'package:sip_calculator/presentation/controllers/calc_switch_controller.dart';

class TabbarButton extends StatefulWidget {
  const TabbarButton({super.key});

  @override
  State<TabbarButton> createState() => _TabbarButtonState();
}

class _TabbarButtonState extends State<TabbarButton> {
  final calcSwitchCntr = Get.put(CalcSwitchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 30, 30, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 200,
          child: Stack(
            children: [
              Obx(
                () => AnimatedAlign(
                  curve: Curves.ease,
                  alignment: Alignment(calcSwitchCntr.xAlign.toDouble(), 0),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: calcSwitchCntr.selectedValue ? 85 : 100,
                    height: 30,
                    decoration: kDecoration(borderRadius: 30),
                  ),
                ),
              ),
              customButton(
                title: 'SIP',
                width: 85,
                alignValue: -1,
                onTap: () {
                  calcSwitchCntr.switchToSip(-1, true);
                },
              ),
              customButton(
                title: 'Lumpsum',
                width: 100,
                alignValue: 1,
                onTap: () {
                  calcSwitchCntr.switchToSip(1, false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector customButton({
    required String title,
    required double alignValue,
    required double width,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment(alignValue, 0),
        child: Container(
          width: width,
          height: 30,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Text(title, style: AppTextStyles.main),
        ),
      ),
    );
  }
}
