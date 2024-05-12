import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/utils/decoration.dart';
import 'package:sip_calculator/presentation/controllers/sip_controller.dart';
import 'package:sip_calculator/presentation/views/home/widgets/slider_widget.dart';

class SipCalculator extends StatefulWidget {
  const SipCalculator({
    super.key,
    required this.investmentType,
  });

  final String investmentType;

  @override
  State<SipCalculator> createState() => _SipCalculatorState();
}

class _SipCalculatorState extends State<SipCalculator> {
  final monthyInvestController = TextEditingController();
  final interestRateController = TextEditingController();
  final yearController = TextEditingController();

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
                title: widget.investmentType,
                value: '${sipController.monthlyInvestment}',
                start: '₹1',
                minValue: 500,
                end: '₹1 CR',
                maxValue: 10000000,
                divisions: (10000000 - 500) ~/ 100,
                onSliderChanged: (val) {
                  if (val >= 500 && val <= 10000000) {
                    sipController.setMonthyInvestMent(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 500 && value <= 10000000) {
                      sipController.setMonthyInvestMent(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[1-9]\d{0,6}$|^10000000$'),
                    replacementString: '${sipController.monthlyInvestment}',
                  ),
                ],
              ),

              // ============= Expected Return =============
              SliderWidget(
                title: 'Expected Return',
                value: '${sipController.interestRate}',
                start: '1%',
                minValue: 1,
                end: '100%',
                maxValue: 100,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 100) {
                    sipController.setInterestRate(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 100) {
                      sipController.setInterestRate(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[1-9]\d{0,1}$|^100$'),
                    replacementString: '${sipController.interestRate}',
                  ),
                ],
              ),

              // ============= Time period =============
              SliderWidget(
                title: 'Monthy Installment',
                value: '${sipController.totalYears}',
                start: '1 yr',
                minValue: 1,
                end: '50 yr',
                maxValue: 50,
                onSliderChanged: (val) {
                  if (val >= 1 && val <= 50) {
                    sipController.setTotalYears(val.round());
                    sipController.calculateSip();
                  }
                },
                onTextChanged: (val) {
                  if (val.isNotEmpty) {
                    double value = double.parse(val);
                    if (value >= 1 && value <= 50) {
                      sipController.setTotalYears(value.round());
                      sipController.calculateSip();
                    }
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[1-5][0-9]?$'),
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
