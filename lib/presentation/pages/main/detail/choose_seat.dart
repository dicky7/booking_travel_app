import 'package:booking_travel_app/data/model/destination_model.dart';
import 'package:booking_travel_app/data/model/transaction_model.dart';
import 'package:booking_travel_app/presentation/bloc/seat/seat_cubit.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/checkout_page.dart';
import 'package:booking_travel_app/presentation/widget/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../utils/theme.dart';
import '../../../widget/custom_button.dart';

class ChooseSeat extends StatelessWidget {
  static const routeName = "/choose-seat";

  final DestinationModel destination;
  const ChooseSeat({Key? key, required this.destination}) : super(key: key);

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
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
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
                    SeatItem(id: "A1", isAvailable: false),
                    SeatItem(id: "B1",  isAvailable: false),
                    buildSeatNumber(context, "1"),
                    SeatItem(id: "C1"),
                    SeatItem(id: "D1"),
                  ],
                ),
              ),

              //SEAT NO 2
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: "A2"),
                    SeatItem(id: "B2"),
                    buildSeatNumber(context, "2"),
                    SeatItem(id: "C2"),
                    SeatItem(id: "D2"),
                  ],
                ),
              ),

              //SEAT NO 3
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: "A3"),
                    SeatItem(id: "B3"),
                    buildSeatNumber(context, "3"),
                    SeatItem(id: "C3"),
                    SeatItem(id: "D3"),
                  ],
                ),
              ),

              //SEAT NO 4
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: "A4"),
                    SeatItem( id: "B4"),
                    buildSeatNumber(context, "4"),
                    SeatItem(id: "C4"),
                    SeatItem(id: "D4"),
                  ],
                ),
              ),

              //SEAT NO 5
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: "A5"),
                    SeatItem(id: "B5"),
                    buildSeatNumber(context, "5"),
                    SeatItem(id: "C5"),
                    SeatItem(id: "D5"),
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
                      state.join(", "),
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
                      NumberFormat.currency(
                          locale: "id",
                          symbol: "IDR ",
                          decimalDigits: 0
                      ).format(state.length * destination.price),
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
      },
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

  Widget buildCheckoutButton(BuildContext context) {
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        return CustomButton(
          title: "Continue to Checkout",
          onPressed: () {
            int price = destination.price * state.length;
            Navigator.pushNamed(
                context,
                CheckoutPage.routeName,
                arguments: TransactionModel(
                    destionation: destination,
                    amountOfTraveler: state.length,
                    selectedSeat: state.join(", "),
                    insurance: true,
                    refundable: false,
                    vat: 0.45,
                    price: price,
                    grandTotal: price + (price * 0.45).toInt())
            );
          },
        );
      },
    );
  }
}
