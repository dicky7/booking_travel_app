import 'package:booking_travel_app/presentation/widget/checkout_detail_item.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/new_destination_card.dart';
import '../main_page.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = "/checkout";
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: Column(
              children: [
                buildHeader(context),
                bookingDetails(context),
                paymentDetails(context),
                paynowButton(context),
                tagButton(context)
              ],

            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context){
    return Column(
      children: [
        Image.asset(
          "asset/image_checkout.png",
          height: 132,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CGK",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "Tangerang",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "CGK",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "Tangerang",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget destinationBooking(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("asset/image_destination8.png")
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rome",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                maxLines: 1,
              ),
              Text(
                "Italy",
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
              "4.8",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor),
            )
          ],
        ),
      ],
    );
  }

  Widget bookingDetails(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          destinationBooking(context),
          const SizedBox(height: 20),

          //NOTE: BOOKING DETAIL
          Text(
            "Booking Details",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.w600
            ),
          ),

          //NOTE: BOOKING DETAIL ITEM
          BookingDetailItem(
              title: "Traveler",
              valueText: "2 person",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Seat",
              valueText: "A3, B3",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Insurance",
              valueText: "YES",
              valueColor: kGreenColor
          ),
          BookingDetailItem(
              title: "Refundable",
              valueText: "No",
              valueColor: kRedColor
          ),
          BookingDetailItem(
              title: "VAT",
              valueText: "45%",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Price",
              valueText: "IDR 8.500.690",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Grand Total",
              valueText: "IDR 12.000.000",
              valueColor: kBlackColor
          ),
        ],
      ),
    );
  }

  Widget paymentDetails(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Details",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 70,
                width: 100,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "asset/icon_plane.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Pay",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhiteColor),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IDR. 200.000.000",
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Current Balance",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget paynowButton(BuildContext context){
    return CustomButton(
      title: "Pay Now",
      onPressed: () {
        Navigator.pushReplacementNamed(context, MainPage.routeName);
      },
    );
  }

  Widget tagButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        "Terms and Conditions",
        style: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(color: kGreyColor, decoration: TextDecoration.underline),
      ),
    );
  }


}
