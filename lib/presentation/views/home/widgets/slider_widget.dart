import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';
import 'package:sip_calculator/core/utils/decoration.dart';
import 'package:sip_calculator/core/utils/gap.dart';
import 'package:sip_calculator/core/utils/thumb_shape.dart';
import 'package:sip_calculator/core/utils/track_shape.dart';

class SliderWidget extends StatefulWidget {
  final String title;
  final String value;
  final String start;
  final double minValue;
  final String end;
  final double maxValue;
  final int? divisions;
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
    required this.onSliderChanged,
    required this.onTextChanged,
    required this.inputFormatters,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.value;
    super.initState();
  }

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
                  style: kTextStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child: valueInputField(),
              )
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
                style: kTextStyle,
              ),
              const Spacer(),
              Text(
                widget.end,
                style: kTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  TextFormField valueInputField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: textController,
      textAlign: TextAlign.end,
      onChanged: widget.onTextChanged,
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(
        fontSize: 13,
        color: AppColors.lDarkPurple,
      ),
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
        contentPadding: const EdgeInsets.fromLTRB(0, 3, 8, 3),
      ),
    );
  }
}
