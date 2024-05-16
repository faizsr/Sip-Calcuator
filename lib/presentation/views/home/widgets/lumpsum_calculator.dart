import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/utils/decoration.dart';
import 'package:sip_calculator/presentation/controllers/lumpsum_controller.dart';
import 'package:sip_calculator/presentation/views/home/widgets/slider_widget.dart';

class LumpSumCalculator extends StatefulWidget {
  const LumpSumCalculator({super.key});

  @override
  State<LumpSumCalculator> createState() => LumpSumCalculatorState();
}

class LumpSumCalculatorState extends State<LumpSumCalculator> {
  final lumpSumController = Get.put(LumpSumController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: kDecoration(borderRadius: 20),
          child: Column(
            children: [
              // ============= Monthy Installment =============
              SliderWidget(
                controller: lumpSumController.investedTextController,
                title: 'Total Investment',
                value: '${lumpSumController.investedAmount}',
                start: '₹1',
                minValue: 500,
                end: '₹10 L',
                maxValue: 1000000,
                divisions: (1000000 - 500) ~/ 1000,
                onSliderChanged: (val) {
                  if (val >= 500 && val <= 1000000) {
                    lumpSumController.setInvestedAmount(val.round());
                    lumpSumController.calculateLumpsum();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 500 && value <= 1000000) {
                      lumpSumController.setInvestedAmount(value.round());
                      lumpSumController.calculateLumpsum();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[1-9]\d{0,5}$|^1000000$'),
                    replacementString: '${lumpSumController.investedAmount}',
                  ),
                ],
              ),

              // ============= Expected Return =============
              SliderWidget(
                controller: lumpSumController.interestTextController,
                title: 'Expected Return',
                value: '${lumpSumController.interestRate}',
                start: '1%',
                minValue: 1,
                end: '30%',
                maxValue: 30,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 30) {
                    lumpSumController.setInterestRate(val.round());
                    lumpSumController.calculateLumpsum();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 30) {
                      lumpSumController.setInterestRate(value.round());
                      lumpSumController.calculateLumpsum();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(3[00]|[12][0-9]|[1-9])$'),
                    replacementString: '${lumpSumController.interestRate}',
                  ),
                ],
              ),

              // ============= Time period =============
              SliderWidget(
                controller: lumpSumController.yearTextController,
                title: 'Time Period',
                value: '${lumpSumController.totalYears}',
                start: '1 yr',
                minValue: 1,
                end: '40 yr',
                maxValue: 40,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 40) {
                    lumpSumController.setTotalYears(val.round());
                    lumpSumController.calculateLumpsum();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 40) {
                      lumpSumController.setTotalYears(value.round());
                      lumpSumController.calculateLumpsum();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(4[0-0]|[1-3][0-9]|[1-9])$'),
                    replacementString: '${lumpSumController.totalYears}',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
