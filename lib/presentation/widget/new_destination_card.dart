import 'package:booking_travel_app/data/model/destination_model.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/detail_page.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewDestinationCard extends StatelessWidget {
  final DestinationModel destinationModel;

  const NewDestinationCard({Key? key, required this.destinationModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName);
      },
      child: Container(
        width: double.infinity,
        height: 90,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(14)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(destinationModel.imageUrl)
                  )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationModel.name,
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                    maxLines: 1,
                  ),
                  Text(
                    destinationModel.city,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                    maxLines: 1,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/icon_star.png",
                  height: 17,
                  width: 17,
                ),
                const SizedBox(width: 3),
                Text(
                  "${destinationModel.rating}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
