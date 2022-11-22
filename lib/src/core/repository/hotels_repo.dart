import 'package:bdb_challenge/src/core/data/firestore_database.dart';
import 'package:bdb_challenge/src/core/models/hotels_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HotelRepository {
  Future<List<Hotel>> get hotels  async =>await convertHotels();

   Future<List <Hotel>> convertHotels () async {
     List<Hotel> hotels = [];
   DataBaseFirestore database = DataBaseFirestore();
    final hotelsRef = database.fetchHotels().withConverter<Hotel>(
      fromFirestore: (snapshot, _) => Hotel.fromJson(snapshot.data()!),
      toFirestore: (hotel, _) => hotel.toJson(),
    );
    List<QueryDocumentSnapshot<Hotel>> hotel = await hotelsRef
        .get()
        .then((snapshot) => snapshot.docs);


    hotel.forEach((element) {
      hotels.add(element.data());});
    return hotels;
  }

}