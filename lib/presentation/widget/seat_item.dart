import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  //NOTE status 0: Available, 1: Selected, 2: Unavailable
  final int status;
  const SeatItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor(){
      switch(status){
        case 0:
          return kAvailableColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    borderColor(){
      switch(status){
        case 0:
          return kPrimaryColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    child(){
      switch(status){
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              "You",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhiteColor),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor()
        )
      ),
      child: child(),

    );
  }
}
