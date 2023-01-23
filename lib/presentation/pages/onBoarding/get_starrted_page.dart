import 'package:booking_travel_app/presentation/pages/onBoarding/sign_up_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class GetStartedPage extends StatelessWidget {
  static const rootName = "/get_started";

  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/image_get_started.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: kWhiteColor, fontSize: 32),
                ),
                const SizedBox(height: 10),
                Text(
                  "Explore new world with us and let yourself get an amazing experiences",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption!.copyWith(color: kWhiteColor, fontSize: 16),
                ),
                CustomButton(
                  title: "Get Started",
                  width: 280,
                  margin: const EdgeInsets.only(top: 50, bottom: 80),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
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
