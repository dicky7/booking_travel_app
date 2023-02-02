part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transaction;

  TransactionSuccess(this.transaction);

  @override
  // TODO: implement props
  List<Object> get props => [transaction];

}

class TransactionError extends TransactionState {
  final String message;

  TransactionError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}