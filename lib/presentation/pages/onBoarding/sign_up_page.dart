// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/bonus_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/sign_in_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_text_form_field.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/custom_button.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = "/sign_up";

  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  final TextEditingController hobbyController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();

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
                    buildTitle(context),
                    inputSection(context),
                    tagButton(context)
                  ],
                ),
              )
          )
      ),
    );
  }

  Text buildTitle(BuildContext context) {
    return Text(
      "Join us and get \nyour next journey",
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: kBlackColor, fontWeight: FontWeight.w700),
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                title: "Full Name",
                hintText: "Your Full Name",
                errorText: "Please Input Your Name",
                controller: nameController,
            ),
            CustomTextFormField(
                title: "Email Address",
                hintText: "Your Email Address",
                errorText: "Please Input Your Email",
                controller: emailController,
            ),
            CustomTextFormField(
                title: "Password",
                hintText: "Your Password",
                obscureText: true,
                errorText: "Please Input Your Password",
                controller: passwordController,
            ),
            CustomTextFormField(
                title: "Hobby",
                hintText: "Your Hobby",
                errorText: "Please Input Your Hobby",
                controller: hobbyController,
            ),
            SizedBox(height: 10),
            blocSignUpButton()
          ],
        ),
      ),
    );
  }

  BlocConsumer<AuthCubit, AuthState> blocSignUpButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, BonusPage.routeName);
        }else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.message)
              )
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          title: "Get Started",
          width: 280,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  hobby: hobbyController.text);
            }
          },
        );
      },
    );
  }

  Widget tagButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignInPage.routeName);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 25),
        child: Text(
          "Have an account? Sign in",
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: kGreyColor, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
