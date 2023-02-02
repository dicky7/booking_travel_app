import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/theme.dart';
import '../../../bloc/main_page/page_cubit.dart';
import '../../../widget/custom_button.dart';
import '../main_page.dart';

class SuccessCheckoutPage extends StatelessWidget {
  static const routeName = "success";
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'asset/image_success.png',
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 32)
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushReplacementNamed(context, MainPage.routeName);
              },
              width: 220,
              margin: const EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
