import 'package:get/get.dart';

class CalcSwitchController extends GetxController {
  final _selectedValue = false.obs;
  final _xAlign = 0.obs;

  int get xAlign => _xAlign.value;
  bool get selectedValue => _selectedValue.value;

  @override
  void onInit() {
    _selectedValue.value = true;
    _xAlign.value = -1;
    super.onInit();
  }

  void switchToSip(int xAlign, bool selectedValue) {
    _selectedValue.value = selectedValue;
    _xAlign.value = xAlign;
  }
}
