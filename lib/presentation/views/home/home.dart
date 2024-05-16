import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/theme.dart';
import 'package:sip_calculator/core/utils/gap.dart';
import 'package:sip_calculator/presentation/views/home/widgets/calculation_card.dart';
import 'package:sip_calculator/presentation/views/home/widgets/heading_widget.dart';
import 'package:sip_calculator/presentation/views/home/widgets/result_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    mySystemTheme(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                gap(0, 10),
                const HeadingWidget(),
                gap(0, 15),
                const ResultArea(),
                gap(0, 15),
                const CalculationArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
