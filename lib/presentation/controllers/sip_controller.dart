import 'package:get/get.dart';

class SipController extends GetxController {
  final _monthyInvestment = 0.obs;
  final _interestRate = 0.obs;
  final _totalYears = 0.obs;
  final _investedAmount = 0.obs;
  final _estimatedReturn = 0.obs;
  final _totalReturn = 0.obs;

  int get monthlyInvestment => _monthyInvestment.value;
  int get interestRate => _interestRate.value;
  int get totalYears => _totalYears.value;
  int get investedAmount => _investedAmount.value;
  int get estimatedReturn => _estimatedReturn.value;
  int get totalReturn => _totalReturn.value;

  @override
  void onInit() {
    _monthyInvestment.value = 25000;
    _interestRate.value = 12;
    _totalYears.value = 10;
    calculateSip();
    super.onInit();
  }

  void setMonthyInvestMent(int value) {
    _monthyInvestment.value = value;
  }

  void setInterestRate(int rate) {
    _interestRate.value = rate;
  }

  void setTotalYears(int years) {
    _totalYears.value = years;
  }

  void calculateSip() {
    double monthlyInterestRate = interestRate / 12 / 100;
    int totalMonths = totalYears * 12;
    double futureValue = 0;

    for (int i = 0; i < totalMonths; i++) {
      futureValue =
          (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
    }
    _investedAmount.value = monthlyInvestment * totalMonths;
    _totalReturn.value = futureValue.round();
    _estimatedReturn.value = totalReturn - investedAmount;
  }
}
