import 'package:booking_travel_app/presentation/pages/main/home/home_page.dart';
import 'package:booking_travel_app/presentation/widget/custom_bottom_navigation_item.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            buildContent(),
            customBottomBarNavigation()],
        ),
      ),
    );
  }

  Widget buildContent(){
    return const HomePage();
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
          children: const [
            CustomBottomNavigationItem(
              imageAsset: "asset/icon_home.png",
              isSelected: true,
            ),
            CustomBottomNavigationItem(imageAsset: "asset/icon_booking.png"),
            CustomBottomNavigationItem(imageAsset: "asset/icon_card.png"),
            CustomBottomNavigationItem(imageAsset: "asset/icon_settings.png")
          ],
        ),
      ),
    );
  }
}
