import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/datasources/api/transaction_service.dart';
import '../../../data/model/transaction_model.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transactionModel)async{
    try{
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      emit(TransactionSuccess([]));
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }

  void getTransaction() async{
    try{
      emit(TransactionLoading());
      List<TransactionModel> transaction = await TransactionService().getDestination();
      emit(TransactionSuccess(transaction));
    }catch(e){
      emit(TransactionError(e.toString()));
    }
  }
}
