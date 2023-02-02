import 'package:booking_travel_app/presentation/bloc/seat/seat_cubit.dart';
import 'package:booking_travel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  //NOTE status 0: Available, 1: Selected, 2: Unavailable
  final bool isAvailable;
  final String id;
  const SeatItem({Key? key, required this.id, this.isAvailable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelectedSeat(id);

    backgroundColor(){
      if (!isAvailable) {
        return kBackgroundColor;
      }  else{
        if (isSelected) {
          return kPrimaryColor;
        }else{
          return kAvailableColor;
        }
      }
    }

    borderColor(){
      if (!isAvailable) {
        return kBackgroundColor;
      }  else{
        return kAvailableColor;
      }
    }

    child(){
      if (isSelected) {
        return Center(
          child: Text(
            "You",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhiteColor),
          ),
        );
      }else{
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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

      ),
    );
  }
}
