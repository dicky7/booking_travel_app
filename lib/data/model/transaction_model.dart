import 'package:booking_travel_app/data/model/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable{
  final String id;
  final DestinationModel destionation;
  final int amountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final grandTotal;

  TransactionModel(
      {this.id = "",
      required this.destionation,
      required this.amountOfTraveler,
      required this.selectedSeat,
      required this.insurance,
      required this.refundable,
      required this.vat,
      required this.price,
      required this.grandTotal});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destionation: DestinationModel.fromJson(json["destination"]["id"], json["destination"]),
        amountOfTraveler: json["amountOfTraveler"],
        selectedSeat: json["selectedSeat"],
        insurance: json["insurance"],
        refundable: json["refundable"],
        vat: json["vat"],
        price: json["price"],
        grandTotal: json["grandTotal"]
      );

  @override
  // TODO: implement props
  List<Object?> get props =>[
    destionation,
    amountOfTraveler,
    selectedSeat,
    insurance,
    refundable,
    vat,
    price,
    grandTotal
  ];

}