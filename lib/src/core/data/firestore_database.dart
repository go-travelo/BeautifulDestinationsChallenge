import 'package:bdb_challenge/src/core/models/hotels_model.dart';
import 'package:bdb_challenge/src/ui/widgets/hotels_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class DatabaseFirestoreInterface {

}

class DataBaseFirestore extends DatabaseFirestoreInterface{

   CollectionReference<Object?> fetchHotels() {
     // Create a CollectionReference called users that references the firestore collection
     CollectionReference hotels = FirebaseFirestore.instance.collection('hotels');
    // Call the user's CollectionReference to add a new user
    return hotels;
  }

}