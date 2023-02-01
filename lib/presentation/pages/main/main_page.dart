import 'package:booking_travel_app/presentation/bloc/main_page/page_cubit.dart';
import 'package:booking_travel_app/presentation/pages/main/home/home_page.dart';
import 'package:booking_travel_app/presentation/pages/main/settings/settings_page.dart';
import 'package:booking_travel_app/presentation/pages/main/transaction/transaction_page.dart';
import 'package:booking_travel_app/presentation/pages/main/wallet/wallet_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_bottom_navigation_item.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [buildContent(state), customBottomBarNavigation()],
            ),
          ),
        );
      },
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const TransactionPage();
      case 2:
        return const WalletPage();
      case 3:
        return const SettingsPage();
      default:
        return const HomePage();
    }
  }

  Widget customBottomBarNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: kGreyColor.withOpacity(0.2), blurRadius: 5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomNavigationItem(
                index: 0,
                imageUrl: "asset/icon_home.png",
            ),
            CustomBottomNavigationItem(
                index: 1,
                imageUrl: "asset/icon_booking.png"
            ),
            CustomBottomNavigationItem(
                index: 2,
                imageUrl: "asset/icon_card.png"),
            CustomBottomNavigationItem(
                index: 3,
                imageUrl: "asset/icon_settings.png")
          ],
        ),
      ),
    );
  }
}
