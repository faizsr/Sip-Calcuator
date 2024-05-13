import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
import 'package:sip_calculator/core/constants/apptextstyles.dart';
import 'package:sip_calculator/core/utils/gap.dart';
import 'package:sip_calculator/core/utils/thumb_shape.dart';
import 'package:sip_calculator/core/utils/track_shape.dart';
import 'package:sip_calculator/presentation/widgets/custom_text_field.dart';
import 'package:sip_calculator/presentation/controllers/sip_controller.dart';

class SliderWidget extends StatefulWidget {
  final String title;
  final String value;
  final String start;
  final double minValue;
  final String end;
  final double maxValue;
  final int? divisions;
  final TextEditingController controller;
  final void Function(double)? onSliderChanged;
  final void Function(String)? onTextChanged;
  final List<TextInputFormatter>? inputFormatters;
  const SliderWidget({
    super.key,
    required this.title,
    required this.value,
    required this.start,
    required this.minValue,
    required this.end,
    required this.maxValue,
    this.divisions,
    required this.controller,
    required this.onSliderChanged,
    required this.onTextChanged,
    required this.inputFormatters,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final sipController = Get.put(SipController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  widget.title,
                  style: AppTextStyles.light,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: widget.controller,
                  inputFormatters: widget.inputFormatters,
                  onTextChanged: widget.onTextChanged,
                ),
              ),
            ],
          ),
          gap(0, 10),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.lDarkPurple,
              inactiveTrackColor: AppColors.lLightYellow,
              thumbShape: const CircleThumbShape(thumbRadius: 8),
              trackHeight: 2,
              trackShape: CustomTrackShape(),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10.0),
            ),
            child: Slider.adaptive(
              value: double.parse(widget.value),
              min: widget.minValue,
              max: widget.maxValue,
              divisions: widget.divisions,
              onChanged: widget.onSliderChanged,
            ),
          ),
          Row(
            children: [
              Text(
                widget.start,
                style: AppTextStyles.light,
              ),
              const Spacer(),
              Text(
                widget.end,
                style: AppTextStyles.light,
              ),
            ],
          )
        ],
      ),
    );
  }
}
