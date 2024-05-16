import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LumpSumController extends GetxController {
  // ============== Values for Caluclation ==============
  final _investedAmount = 0.obs;
  final _interestRate = 0.obs;
  final _totalYears = 0.obs;

  int get investedAmount => _investedAmount.value;
  int get interestRate => _interestRate.value;
  int get totalYears => _totalYears.value;

  // ============== Result Values ==============
  final _estimatedReturn = 0.obs;
  final _totalReturn = 0.obs;

  int get estimatedReturn => _estimatedReturn.value;
  int get totalReturn => _totalReturn.value;

  // ============== Progress Percent ==============
  final _returnPercent = 0.0.obs;

  double get returnPercent => _returnPercent.value;

  // ============== Value Input Controllers ==============
  final _totalTextController = TextEditingController().obs;
  final _interestTextController = TextEditingController().obs;
  final _yearTextController = TextEditingController().obs;

  TextEditingController get investedTextController =>
      _totalTextController.value;
  TextEditingController get interestTextController =>
      _interestTextController.value;
  TextEditingController get yearTextController => _yearTextController.value;

  @override
  void onInit() {
    _investedAmount.value = 20000;
    _interestRate.value = 5;
    _totalYears.value = 20;
    investedTextController.text = investedAmount.toString();
    interestTextController.text = interestRate.toString();
    yearTextController.text = totalYears.toString();
    calculateLumpsum();
    super.onInit();
  }

  // ============== Set Invested Amount ==============
  void setInvestedAmount(int value) {
    _investedAmount.value = value;
    investedTextController.value = investedTextController.value.copyWith(
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

  // ============== Calculating Lumpsum ==============
  void calculateLumpsum() {
    double annualInterestRate = interestRate / 100;
    double futureValue =
        investedAmount * pow((1 + annualInterestRate), totalYears).toDouble();

    _totalReturn.value = futureValue.round();
    _estimatedReturn.value = totalReturn - investedAmount;

    // ============== Calulating Progress Percent ==============
    _returnPercent.value = (estimatedReturn / totalReturn) * 100 / 100;
  }
}
