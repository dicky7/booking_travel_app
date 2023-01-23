import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../pages/main/detail/detail_page.dart';

class DestinationCard extends StatelessWidget {
  final String name;
  final String city;
  final String image;
  final double rating;

  const DestinationCard(
      {Key? key,
        required this.name,
        required this.city,
        required this.image,
        required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName);
      },
      child: Container(
        height: 325,
        width: 200,
        margin: const EdgeInsets.only(left: 24),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(image)
                  )
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15)),
                      color: kWhiteColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/icon_star.png",
                        height: 17,
                        width: 17,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rating.toString(),
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                    maxLines: 1,
                  ),
                  Text(
                    city,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
