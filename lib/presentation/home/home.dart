import 'package:flutter/material.dart';
import 'package:sip_calculator/core/constants/theme.dart';
import 'package:sip_calculator/presentation/home/widgets/heading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    mySystemTheme(context);
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeadingWidget(),
            
          ],
        ),
      ),
    );
  }
}
