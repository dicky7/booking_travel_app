import 'package:booking_travel_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:booking_travel_app/presentation/bloc/destination/destination_cubit.dart';
import 'package:booking_travel_app/presentation/widget/destination_card.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/destination_model.dart';
import '../../../widget/new_destination_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask((){
      //get destination dipanggil ketika halaman pertama kali dibuka
      context.read<DestinationCubit>().getDestination();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              Flexible(child: popularDestination(context)),
              Flexible(child: newDestination(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Howdy",
                      style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                    ),
                    Text(
                      state.userModel.name,
                      style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Where to fly today?",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kGreyColor),
                    )
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "asset/image_profile.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }

  Widget popularDestination(BuildContext context){
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: kRedColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is DestinationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(state is DestinationSuccess){
          return Container(
            height: 325,
            margin: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: state.destination.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print("Popular ${state.destination.length}");
                final destiny = state.destination[index];
                return DestinationCard(destination: destiny);
              },
            ),
          );
        }else{
          return const Center(child: Text("error"));
        }
      },
    );
  }

  Widget newDestination(BuildContext context){
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: kRedColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is DestinationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(state is DestinationSuccess){
          return Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 100),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.destination.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final destiny = state.destination[index];
                return NewDestinationCard(destinationModel: destiny);
              },
            ),
          );
        }else{
          return const Center(child: Text("error"));
        }
      },
    );
  }

}
