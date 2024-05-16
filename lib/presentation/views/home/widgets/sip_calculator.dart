import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/utils/decoration.dart';
import 'package:sip_calculator/presentation/controllers/sip_controller.dart';
import 'package:sip_calculator/presentation/views/home/widgets/slider_widget.dart';

class SipCalculator extends StatefulWidget {
  const SipCalculator({super.key});

  @override
  State<SipCalculator> createState() => _SipCalculatorState();
}

class _SipCalculatorState extends State<SipCalculator> {
  final sipController = Get.put(SipController());

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
                controller: sipController.monthlyTextController,
                title: 'Monthy Investment',
                value: '${sipController.monthlyInvestment}',
                start: '₹1',
                minValue: 500,
                end: '₹10 L',
                maxValue: 1000000,
                divisions: (1000000 - 500) ~/ 1000,
                onSliderChanged: (val) {
                  if (val >= 500 && val <= 1000000) {
                    sipController.setMonthyInvestMent(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 500 && value <= 1000000) {
                      sipController.setMonthyInvestMent(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[1-9]\d{0,5}$|^1000000$'),
                    replacementString: '${sipController.monthlyInvestment}',
                  ),
                ],
              ),

              // ============= Expected Return =============
              SliderWidget(
                controller: sipController.interestTextController,
                title: 'Expected Return',
                value: '${sipController.interestRate}',
                start: '1%',
                minValue: 1,
                end: '30%',
                maxValue: 30,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 30) {
                    sipController.setInterestRate(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 30) {
                      sipController.setInterestRate(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(3[00]|[12][0-9]|[1-9])$'),
                    replacementString: '${sipController.interestRate}',
                  ),
                ],
              ),

              // ============= Time period =============
              SliderWidget(
                controller: sipController.yearTextController,
                title: 'Time Period',
                value: '${sipController.totalYears}',
                start: '1 yr',
                minValue: 1,
                end: '40 yr',
                maxValue: 40,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 40) {
                    sipController.setTotalYears(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 40) {
                      sipController.setTotalYears(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(4[0-0]|[1-3][0-9]|[1-9])$'),
                    replacementString: '${sipController.totalYears}',
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
