import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomInterest extends StatelessWidget {
  final String interest;
  const CustomInterest({Key? key, required this.interest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            "asset/icon_check.png",
            height: 13,
            width: 13,
          ),
          const SizedBox(width: 6),
          Text(
            interest,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor,),
          ),
        ],

      ),
    );
  }
}
