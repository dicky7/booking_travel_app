import 'package:bloc/bloc.dart';
import 'package:booking_travel_app/data/datasources/api/destination_service.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/destination_model.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void getDestination() async{
    try{
      emit(DestinationLoading());
      List<DestinationModel> destinations = await DestinationService().getDestination();
      emit(DestinationSuccess(destinations));
    }catch(e){
      emit(DestinationError(e.toString()));
    }
  }
}
