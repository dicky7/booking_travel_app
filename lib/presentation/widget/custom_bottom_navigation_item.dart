import 'package:flutter/cupertino.dart';

import '../../utils/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageAsset;
  final bool isSelected;

  const CustomBottomNavigationItem(
      {Key? key, required this.imageAsset, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Image.asset(
          imageAsset,
          height: 24,
          width: 24,
        ),
        Container(
          height: 3,
          width: 30,
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : kTransparentColor,
              borderRadius: BorderRadius.circular(15)),
        )
      ],
    );
  }
}
