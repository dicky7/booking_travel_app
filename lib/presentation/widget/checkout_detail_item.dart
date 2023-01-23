import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class BookingDetailItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;
  const BookingDetailItem({Key? key, required this.title, required this.valueText, required this.valueColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "asset/icon_check.png",
            height: 16,
            width: 16,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: kBlackColor,
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          Text(
            valueText,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
