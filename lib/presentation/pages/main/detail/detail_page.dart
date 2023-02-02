import 'package:booking_travel_app/data/model/destination_model.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/choose_seat.dart';
import 'package:booking_travel_app/presentation/widget/custom_interest.dart';
import 'package:booking_travel_app/presentation/widget/custom_photo.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widget/custom_button.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";

  final DestinationModel destination;
  const DetailPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildImage(),
            customShadow(),
            content(context)
          ],
        ),
      ),
    );
  }

  Container buildImage() {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(destination.imageUrl)
          )
      ),
    );
  }

  Widget customShadow() {
    return Container(
      margin: const EdgeInsets.only(top: 236),
      height: 214,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95)
          ]
        )
      )
    );
  }

  Widget content(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          //emblem icon
          Image.asset(
            "asset/icon_emblem.png",
            width: 108,
            height: 24,
          ),

          //title content
          Container(
            margin: const EdgeInsets.only(top: 256,left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w700
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        destination.city,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhiteColor),
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
                      "${destination.rating}",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhiteColor, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),

          //about content
          Container(
            margin: const EdgeInsets.only(top: 30,left: 24, right: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: kBlackColor,
                    height: 2
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Photo",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomPhoto(image: "asset/image_photo1.png"),
                    CustomPhoto(image: "asset/image_photo2.png"),
                    CustomPhoto(image: "asset/image_photo3.png"),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Interest",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomInterest(interest: "Kids Park"),
                    CustomInterest(interest: "Honor Bridge")
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomInterest(interest: "City Museum"),
                    CustomInterest(interest: "Central Mall")
                  ],
                ),
              ],
            ),
          ),

          //price & book button
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                            locale: "id",
                            symbol: "IDR ",
                            decimalDigits: 0
                        ).format(destination.price),
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "per orang",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  title: "Book Now",
                  width: 170,
                  onPressed: () {
                    Navigator.pushNamed(context, ChooseSeat.routeName, arguments: destination);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
