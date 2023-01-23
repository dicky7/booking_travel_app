import 'dart:async';

import 'package:booking_travel_app/presentation/pages/onBoarding/get_starrted_page.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const rootName = "/splash";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, GetStartedPage.rootName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/icon_plane.png")
                )
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "AIRPLANE",
              style: Theme.of(context).textTheme.headline5!.copyWith(letterSpacing: 10, color: kWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
