import 'package:booking_travel_app/data/model/transaction_model.dart';
import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/sucess_checkout_page.dart';
import 'package:booking_travel_app/presentation/widget/checkout_detail_item.dart';
import 'package:booking_travel_app/presentation/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../utils/theme.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/new_destination_card.dart';
import '../main_page.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = "/checkout";

  final TransactionModel transaction;
  const CheckoutPage({Key? key, required this.transaction}) : super(key: key);

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
                TransactionCard(transaction: transaction),
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




  Widget paymentDetails(BuildContext context){
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                          NumberFormat.currency(
                              locale: "id",
                              symbol: "IDR ",
                              decimalDigits: 0
                          ).format(state.userModel.balance),
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
        }else{
          return const SizedBox();
        }
      },
    );
  }

  Widget paynowButton(BuildContext context){
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          Navigator.pushReplacementNamed(context, SuccessCheckoutPage.routeName);
        }else if (state is TransactionError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.message)
              )
          );
        }
      },
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          title: "Pay Now",
          onPressed: () {
            context.read<TransactionCubit>().createTransaction(transaction);
          },
        );
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
