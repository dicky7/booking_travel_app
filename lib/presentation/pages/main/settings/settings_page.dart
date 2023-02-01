import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/main_page/page_cubit.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/splash_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_button.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = "/settings";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: kRedColor,
          ));
        }else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushReplacementNamed(context, SplashPage.rootName);
        }  
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }  
        return Center(
          child: CustomButton(
            title: "Sign Out",
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          ),
        );
      },
    );
  }
}
