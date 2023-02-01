import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  static const routeName = "/transaction";
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Transaction"),
    );
  }
}
