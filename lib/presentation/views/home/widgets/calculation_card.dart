import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/presentation/controllers/calc_switch_controller.dart';
import 'package:sip_calculator/presentation/views/home/widgets/sip_calculator.dart';
import 'package:sip_calculator/presentation/views/home/widgets/tabbar_button.dart';

class CalculationArea extends StatelessWidget {
  const CalculationArea({super.key});

  @override
  Widget build(BuildContext context) {
    final calcSwitchCntr = Get.put(CalcSwitchController());

    return Column(
      children: [
        // ============= Tabbar Button =============
        const TabbarButton(),

        // ============= Tabbar View =============
        Obx(() => calcSwitchCntr.selectedValue
            ? const SipCalculator(investmentType: 'Monthy Investment')
            : const SipCalculator(investmentType: 'Total Investment')),
      ],
    );
  }
}
