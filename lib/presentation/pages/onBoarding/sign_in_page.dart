import 'package:booking_travel_app/presentation/pages/main/main_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/theme.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  static const routeName = "/sign_in";

  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
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
      "Sign in with your \nexisting account",
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
            SizedBox(height: 10),
            buildSignInButton()
          ],
        ),
      ),
    );
  }

  buildSignInButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, MainPage.routeName);
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          title: "Sign In",
          width: 280,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,);
            }
          },
        );
      },
    );
  }

  Widget tagButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpPage.routeName);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 25),
        child: Text(
          "Don't Have an account? Sign Up",
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: kGreyColor, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
