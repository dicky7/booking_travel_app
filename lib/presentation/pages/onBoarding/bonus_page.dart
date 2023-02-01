import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/pages/main/main_page.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/custom_button.dart';

class BonusPage extends StatelessWidget {
  static const routeName = "/bonus";
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCardAccount(context),
          const SizedBox(height: 80),
          buildTitle(context),
          buildContent(context),
          CustomButton(
            title: "Get Started",
            width: 220,
            margin: const EdgeInsets.only(top: 50, bottom: 80),
            onPressed: () {
              Navigator.pushReplacementNamed(context, MainPage.routeName);
            },
          )
        ],
      ),
    );
  }

  Container buildContent(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          child: Text(
            "We give you early credit so that you can buy a flight ticket",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption?.copyWith(color: kGreyColor, fontSize: 18),
          ),
        );
  }

  Text buildTitle(BuildContext context) {
    return Text(
          "Big Bonus 🎉",
          style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 32),
        );
  }

  Widget buildCardAccount(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 35),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff5445E5),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: const Offset(0,10)
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.caption?.copyWith(color: kWhiteColor),
                          ),
                          Text(
                            state.userModel.name,
                            style: Theme.of(context).textTheme.headline6?.copyWith(color: kWhiteColor, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "asset/icon_plane.png",
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Pay",
                      style: Theme.of(context).textTheme.headline6?.copyWith(color: kWhiteColor, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Balance",
                  style: Theme.of(context).textTheme.caption?.copyWith(color: kWhiteColor),
                ),
                Text(
                  "IDR. 200.000.000",
                  style: Theme.of(context).textTheme.headline5?.copyWith(color: kWhiteColor),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }
}
