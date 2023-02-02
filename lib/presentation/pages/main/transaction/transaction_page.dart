import 'package:booking_travel_app/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:booking_travel_app/presentation/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/theme.dart';

class TransactionPage extends StatefulWidget {
  static const routeName = "/transaction";

  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().getTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.message)
                )
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is TransactionSuccess){
            if (state.transaction.isEmpty) {
              return Center(
                child: Text(
                    "No Transaction",
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            } else{
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                  itemCount: state.transaction.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TransactionCard(transaction: state.transaction[index]);
                  },
                ),
              );
            }

          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
