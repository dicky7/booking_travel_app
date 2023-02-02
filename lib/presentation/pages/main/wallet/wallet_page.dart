import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/theme.dart';
import '../../../bloc/auth/auth_cubit.dart';

class WalletPage extends StatelessWidget {
  static const routeName = "/wallet";
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              height: 211,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff5445E5),
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.5),
                        blurRadius: 50,
                        offset: const Offset(0, 10)
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: kWhiteColor),
                            ),
                            Text(
                              state.userModel.name,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: kWhiteColor, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "asset/icon_plane.png",
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Pay",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: kWhiteColor, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Balance",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: kWhiteColor),
                  ),
                  Text(
                    "IDR. 200.000.000",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: kWhiteColor),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
