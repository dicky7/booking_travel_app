import 'package:booking_travel_app/data/model/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService{
  final CollectionReference _transactionReference =
  FirebaseFirestore.instance.collection("transactions");

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      _transactionReference.add({
        "destination": transactionModel.destionation.toJson(),
        "amountOfTraveler": transactionModel.amountOfTraveler,
        "selectedSeat": transactionModel.selectedSeat,
        "insurance": transactionModel.insurance,
        "refundable": transactionModel.refundable,
        "vat": transactionModel.vat,
        "price": transactionModel.price,
        "grandTotal": transactionModel.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> getDestination() async{
    try{
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> destinations = result.docs.map((e){
        return TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    }catch(e){
      throw e;
    }

  }

}