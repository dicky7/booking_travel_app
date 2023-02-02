import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id){
    print("prev state $state");
    //konidisi jika seat belum dipilih maka kita akan menambahkan id tersebut di state kita
    if (!isSelectedSeat(id)) {
      state.add(id);
    }else{
      state.remove(id);
    }
    print("current state $state");
    emit(List.from(state));
  }

  bool isSelectedSeat(String id){
    int index = state.indexOf(id);
    print("index $index");

    //condition -1 when seat is selected or in a list of array
    if (index == -1) {
      return false;
    } else{
      //condition when index =! -1 seat is not selected or not in a list of array
      return true;
    }
  }
}
