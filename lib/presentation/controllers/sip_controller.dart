import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SipController extends GetxController {
  // ============== Values for Caluclation ==============
  final _monthyInvestment = 0.obs;
  final _interestRate = 0.obs;
  final _totalYears = 0.obs;

  int get monthlyInvestment => _monthyInvestment.value;
  int get interestRate => _interestRate.value;
  int get totalYears => _totalYears.value;

  // ============== Result Values ==============
  final _totalInvestedAmount = 0.obs;
  final _estimatedReturn = 0.obs;
  final _totalReturn = 0.obs;

  int get totalInvestedAmount => _totalInvestedAmount.value;
  int get estimatedReturn => _estimatedReturn.value;
  int get totalReturn => _totalReturn.value;

  // ============== Progress Percent ==============
  final _returnPercent = 0.0.obs;

  double get returnPercent => _returnPercent.value;

  // ============== Value Input Controllers ==============
  final _monthlyTextController = TextEditingController().obs;
  final _interestTextController = TextEditingController().obs;
  final _yearTextController = TextEditingController().obs;

  TextEditingController get monthlyTextController =>
      _monthlyTextController.value;
  TextEditingController get interestTextController =>
      _interestTextController.value;
  TextEditingController get yearTextController => _yearTextController.value;

  @override
  void onInit() {
    _monthyInvestment.value = 25000;
    _interestRate.value = 12;
    _totalYears.value = 10;
    monthlyTextController.text = monthlyInvestment.toString();
    interestTextController.text = interestRate.toString();
    yearTextController.text = totalYears.toString();
    calculateSip();
    super.onInit();
  }

  // ============== Set Monthly Invested Amount ==============
  void setMonthyInvestMent(int value) {
    _monthyInvestment.value = value;
    monthlyTextController.value = monthlyTextController.value.copyWith(
      text: value.toString(),
    );
  }

  // ============== Set Interest Rate ==============
  void setInterestRate(int rate) {
    _interestRate.value = rate;
    interestTextController.value = interestTextController.value.copyWith(
      text: rate.toString(),
    );
  }

  // ============== Set Total Years ==============
  void setTotalYears(int years) {
    _totalYears.value = years;
    yearTextController.value = yearTextController.value.copyWith(
      text: years.toString(),
    );
  }

  // ============== Calculating SIP ==============
  void calculateSip() {
    double monthlyInterestRate = interestRate / 12 / 100;
    int totalMonths = totalYears * 12;
    double futureValue = 0;

    for (int i = 0; i < totalMonths; i++) {
      futureValue =
          (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
    }
    _totalInvestedAmount.value = monthlyInvestment * totalMonths;
    _totalReturn.value = futureValue.round();
    _estimatedReturn.value = totalReturn - totalInvestedAmount;

    // ============== Calulating Progress Percent ==============
    _returnPercent.value = (estimatedReturn / totalReturn) * 100 / 100;
  }
}
