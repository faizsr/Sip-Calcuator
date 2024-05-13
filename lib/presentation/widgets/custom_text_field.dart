import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
import 'package:sip_calculator/core/constants/apptextstyles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.onTextChanged,
      this.inputFormatters});

  final TextEditingController controller;
  final void Function(String)? onTextChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.end,
      onChanged: onTextChanged,
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: inputFormatters,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.lGray),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(4, 3, 5, 3),
      ),
    );
  }
}
