import 'package:booking_travel_app/data/model/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService{
  CollectionReference _destinationReference = FirebaseFirestore.instance.collection("destination");

  Future<List<DestinationModel>> getDestination() async{
    try{
      QuerySnapshot result = await _destinationReference.get();
      List<DestinationModel> destinations = result.docs.map((e){
        return DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    }catch(e){
      throw e;
    }

  }
}