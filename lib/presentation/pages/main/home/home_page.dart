import 'package:booking_travel_app/presentation/widget/destination_card.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

import '../../../widget/new_destination_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              popularDestination(context),
              newDestination(context)
            ],
          ),
        ),
      ),
    );
  }


  Widget buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy",
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                ),
                Text(
                  "Juliant Robert",
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 6),
                Text(
                  "Where to fly today?",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "asset/image_profile.png",
                width: 60,
                height: 60,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget popularDestination(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            DestinationCard(
              name: "Lake Ciliwung",
              city: "Tanggerang",
              image: "asset/image_destination1.png",
              rating: 4.7,
            ),
            DestinationCard(
              name: "White House",
              city: "Spain",
              image: "asset/image_destination2.png",
              rating: 4.9,
            ),
            DestinationCard(
              name: "Hill Heyo",
              city: "Monaco",
              image: "asset/image_destination3.png",
              rating: 4.7,
            ),
            DestinationCard(
              name: "Menara",
              city: "Japan",
              image: "asset/image_destination4.png",
              rating: 4.8,
            ),DestinationCard(
              name: "Payung Teduh",
              city: "Singapore",
              image: "asset/image_destination5.png",
              rating: 4.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget newDestination(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New This Year",
            style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
          ),

          const NewDestinationCard(
            name: "Danau Baratan",
            city: "Singaraja",
            rating: 4.5,
            image: "asset/image_destination6.png",
          ),
          const NewDestinationCard(
            name: "Sydney Opera",
            city: "Sidnet",
            rating: 4.7,
            image: "asset/image_destination7.png",
          ),
          const NewDestinationCard(
            name: "Roma",
            city: "Italy",
            rating: 4.5,
            image: "asset/image_destination8.png",
          ),
          const NewDestinationCard(
            name: "Danau Baratan",
            city: "Singaraja",
            rating: 4.5,
            image: "asset/image_destination9.png",
          ),
          const NewDestinationCard(
            name: "Paying Teduh",
            city: "Singapore",
            image: "asset/image_destination10.png",
            rating: 4.5,
          ),
        ],
      ),
    );

  }
}
