import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/destination/destination_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/main_page/page_cubit.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/checkout_page.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/choose_seat.dart';
import 'package:booking_travel_app/presentation/pages/main/detail/detail_page.dart';
import 'package:booking_travel_app/presentation/pages/main/home/home_page.dart';
import 'package:booking_travel_app/presentation/pages/main/main_page.dart';
import 'package:booking_travel_app/presentation/pages/main/settings/settings_page.dart';
import 'package:booking_travel_app/presentation/pages/main/transaction/transaction_page.dart';
import 'package:booking_travel_app/presentation/pages/main/wallet/wallet_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/bonus_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/get_starrted_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/sign_in_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/sign_up_page.dart';
import 'package:booking_travel_app/presentation/pages/onBoarding/splash_page.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DestinationCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(textTheme: myTextTheme),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.rootName,
        routes: {
          SplashPage.rootName: (context) => const SplashPage(),
          GetStartedPage.rootName: (context) => const GetStartedPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          SignInPage.routeName: (context) => SignInPage(),
          BonusPage.routeName: (context) => const BonusPage(),
          MainPage.routeName: (context) => const MainPage(),
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => const DetailPage(),
          ChooseSeat.routeName: (context) => const ChooseSeat(),
          CheckoutPage.routeName: (context) => const CheckoutPage(),
          TransactionPage.routeName: (context) => const TransactionPage(),
          WalletPage.routeName: (context) => const WalletPage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
        },
      ),
    );
  }
}
