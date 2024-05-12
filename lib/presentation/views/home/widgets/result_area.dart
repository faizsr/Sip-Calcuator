import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 87.5,
          child: Center(
            child: CircleAvatar(
              backgroundColor: AppColors.lTan,
              radius: 50,
            ),
          ),
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
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Obx amountSide() {
    final sipController = Get.put(SipController());

    return Obx(
      () {
        return Column(
          children: [
            AmountCard(
              title: 'Invested Amount',
              amount: '${sipController.investedAmount}',
            ),
            AmountCard(
              title: 'Estimated Amount',
              amount: '${sipController.estimatedReturn}',
            ),
            AmountCard(
              title: 'Total Amount',
              amount: '${sipController.totalReturn}',
            ),
          ],
        );
      },
    );
  }
}
