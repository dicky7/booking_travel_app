import 'package:booking_travel_app/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/theme.dart';
import 'checkout_detail_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              valueText: "${transaction.amountOfTraveler} person",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Seat",
              valueText: transaction.selectedSeat,
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Insurance",
              valueText: transaction.insurance ? "YES" : "NO",
              valueColor: transaction.insurance ? kGreenColor : kRedColor
          ),
          BookingDetailItem(
              title: "Refundable",
              valueText: transaction.refundable ? "YES" : "NO",
              valueColor: transaction.refundable ? kGreenColor : kRedColor
          ),
          BookingDetailItem(
              title: "VAT",
              valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Price",
              valueText: NumberFormat.currency(
                  locale: "id",
                  symbol: "IDR ",
                  decimalDigits: 0
              ).format(transaction.price),
              valueColor: kBlackColor
          ),
          BookingDetailItem(
              title: "Grand Total",
              valueText: NumberFormat.currency(
                  locale: "id",
                  symbol: "IDR ",
                  decimalDigits: 0
              ).format(transaction.grandTotal),
              valueColor: kBlackColor
          ),
        ],
      ),
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
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(transaction.destionation.imageUrl)
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.destionation.name,
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                maxLines: 1,
              ),
              Text(
                transaction.destionation.city,
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
              "${transaction.destionation.rating}",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kBlackColor),
            )
          ],
        ),
      ],
    );
  }
}
