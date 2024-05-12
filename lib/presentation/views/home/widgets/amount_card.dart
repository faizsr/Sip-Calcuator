import 'package:flutter/cupertino.dart';
import 'package:sip_calculator/core/utils/decoration.dart';

class AmountCard extends StatelessWidget {
  final String title;
  final String amount;
  const AmountCard({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      width: MediaQuery.of(context).size.width / 2.8,
      decoration: kDecoration(borderRadius: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: kTextStyle),
          Text(
            amount,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
