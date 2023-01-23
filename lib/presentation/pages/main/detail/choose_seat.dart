import 'package:booking_travel_app/presentation/pages/main/detail/checkout_page.dart';
import 'package:booking_travel_app/presentation/widget/seat_item.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';
import '../../../widget/custom_button.dart';

class ChooseSeat extends StatelessWidget {
  static const routeName = "/choose-seat";
  const ChooseSeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeaderTitle(context),
                const SizedBox(height: 30),
                buildStatusIcon(context),
                selectSeat(context),
                buildCheckoutButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Text buildHeaderTitle(BuildContext context) {
    return Text(
      "Select Your \nFavorite Seat",
      style: Theme.of(context).textTheme.headline5?.copyWith(
          color: kBlackColor,
          fontWeight: FontWeight.w700
      ),
    );
  }

  Row buildStatusIcon(BuildContext context) {
    return Row(
      children: [
        seatStatus(context, image: "asset/icon_available.png", status: "Available"),
        seatStatus(context, image: "asset/icon_selected.png", status: "Selected"),
        seatStatus(context, image: "asset/icon_unavailable.png", status: "Unavailable")
      ],
    );
  }

  Widget seatStatus(BuildContext context,{required String image, required String status}){
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 16,
            width: 16,
          ),
          const SizedBox(width: 6),
          Text(
            status,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor),
          ),

        ],
      ),
    );
  }

  Widget selectSeat(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             buildSeatNumber(context, "A"),
             buildSeatNumber(context, "B"),
             buildSeatNumber(context, ""),
             buildSeatNumber(context, "C"),
             buildSeatNumber(context, "D"),
           ],
         ),

          // SEAT NO 1
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 2),
                SeatItem(status: 2),
                buildSeatNumber(context, "1"),
                SeatItem(status: 0),
                SeatItem(status: 2),
              ],
            ),
          ),

          //SEAT NO 2
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                buildSeatNumber(context, "2"),
                SeatItem(status: 0),
                SeatItem(status: 2),
              ],
            ),
          ),

          //SEAT NO 3
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 1),
                SeatItem(status: 1),
                buildSeatNumber(context, "3"),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),
          ),

          //SEAT NO 4
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                buildSeatNumber(context, "4"),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),
          ),

          //SEAT NO 5
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                buildSeatNumber(context, "5"),
                SeatItem(status: 2),
                SeatItem(status: 0),
              ],
            ),
          ),

          //NOTE: Your Seat
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Seat",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                ),
                Text(
                  "A3, B3",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: kBlackColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),

          //Note: Total Price
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreyColor),
                ),
                Text(
                  "IDR 540.000.000",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )

        ],
      ),

    );
  }

  Widget buildSeatNumber(BuildContext context, String number) {
    return Container(
      height: 48,
      width: 48,
      child: Center(
        child: Text(
          number,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
        ),
      ),
    );
  }

  CustomButton buildCheckoutButton(BuildContext context) {
    return CustomButton(
      title: "Continue to Checkout",
      onPressed: () {
        Navigator.pushNamed(context, CheckoutPage.routeName);

      },
    );
  }
}
