import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
import 'package:sip_calculator/core/constants/apptextstyles.dart';
import 'package:sip_calculator/presentation/widgets/progress_indicator.dart';
import 'package:sip_calculator/presentation/controllers/calc_switch_controller.dart';
import 'package:sip_calculator/presentation/controllers/lumpsum_controller.dart';
import 'package:sip_calculator/presentation/controllers/sip_controller.dart';
import 'package:sip_calculator/presentation/views/home/widgets/amount_card.dart';

class ResultArea extends StatelessWidget {
  const ResultArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          progressSide(),
          const Spacer(),
          amountSide(),
        ],
      ),
    );
  }

  Column progressSide() {
    final sipController = Get.put(SipController());
    final lumpSumController = Get.put(LumpSumController());
    final calcSwitchController = Get.put(CalcSwitchController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () {
            double endPercent = calcSwitchController.selectedValue
                ? sipController.returnPercent
                : lumpSumController.returnPercent;
            return CustomProgressIndicator(endPercent: endPercent);
          },
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            progressHelper(AppColors.lDarkPurple, 'Invested Amount'),
            const SizedBox(height: 5),
            progressHelper(AppColors.lLightYellow, 'Estimated Amount'),
          ],
        ),
      ],
    );
  }

  Row progressHelper(Color color, String title) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: AppTextStyles.main,
        )
      ],
    );
  }

  Obx amountSide() {
    final sipController = Get.put(SipController());
    final lumpSumController = Get.put(LumpSumController());
    final calcSwitchController = Get.put(CalcSwitchController());
    final formatToSimpleCurrency = NumberFormat.simpleCurrency(locale: 'en_IN');
    final formatToCompactCurrency = NumberFormat.compactLong(locale: 'en_IN');
    formatToSimpleCurrency.maximumFractionDigits = 0;

    return Obx(
      () {
        int investedAmount = calcSwitchController.selectedValue
            ? sipController.totalInvestedAmount
            : lumpSumController.investedAmount;
        int estimatedReturn = calcSwitchController.selectedValue
            ? sipController.estimatedReturn
            : lumpSumController.estimatedReturn;
        int totalReturn = calcSwitchController.selectedValue
            ? sipController.totalReturn
            : lumpSumController.totalReturn;

        return Column(
          children: [
            AmountCard(
              title: 'Invested Amount',
              amount: '$investedAmount'.length > 9
                  ? formatToCompactCurrency.format(investedAmount)
                  : formatToSimpleCurrency.format(investedAmount),
            ),
            AmountCard(
              title: 'Estimated Amount',
              amount: '$estimatedReturn'.length > 9
                  ? formatToCompactCurrency.format(estimatedReturn)
                  : formatToSimpleCurrency.format(estimatedReturn),
            ),
            AmountCard(
              title: 'Total Amount',
              amount: '$totalReturn'.length > 9
                  ? formatToCompactCurrency.format(totalReturn)
                  : formatToSimpleCurrency.format(totalReturn),
            ),
          ],
        );
      },
    );
  }
}
