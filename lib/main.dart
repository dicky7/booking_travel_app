import 'package:booking_travel_app/presentation/pages/main/detail/checkout_page.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/choose_seat.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/detail_page.dart';
import 'package:booking_travel_app/presentation/pages/main/home/home_page.dart';
import 'package:booking_travel_app/presentation/pages/main/main_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/bonus_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/get_starrted_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/sign_up_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/splash_page.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: myTextTheme
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.rootName,
      routes: {
        SplashPage.rootName: (context) => const SplashPage(),
        GetStartedPage.rootName: (context) => const GetStartedPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        BonusPage.routeName: (context) => const BonusPage(),
        MainPage.routeName: (context) => const MainPage(),
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => const DetailPage(),
        ChooseSeat.routeName: (context) => const ChooseSeat(),
        CheckoutPage.routeName: (context) => const CheckoutPage()



      },
    );
  }
}