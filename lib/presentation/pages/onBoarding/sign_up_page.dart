// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booking_travel_app/presentation/pages/onBoarding/bonus_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_text_form_field.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = "/sign_up";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Join us and get \nyour next journey",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: kBlackColor, fontWeight: FontWeight.w700),
            ),
            inputSection(context),
            tagButton(context)
          ],
        ),
      ))),
    );
  }

  Widget inputSection(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          CustomTextFormField(
              title: "Full Name",
              hintText: "Your Full Name",
              errorText: "Please Input Your Name"),
          CustomTextFormField(
              title: "Email Address",
              hintText: "Your Email Address",
              errorText: "Please Input Your Email"),
          CustomTextFormField(
              title: "Password",
              hintText: "Your Password",
              obscureText: true,
              errorText: "Please Input Your Password"),
          CustomTextFormField(
              title: "Hobby",
              hintText: "Your Hobby",
              errorText: "Please Input Your Hobby"),
          SizedBox(height: 10),
          CustomButton(
            title: "Get Started",
            width: 280,
            onPressed: () {
              Navigator.pushNamed(context, BonusPage.routeName);
            },
          )
        ],
      ),
    );
  }

  Widget tagButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 25),
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
