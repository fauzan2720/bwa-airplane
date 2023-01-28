import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/destinations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DestinationService {
  final CollectionReference _destinationRef =
      FirebaseFirestore.instance.collection("destinations");

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationRef.get();

      List<DestinationModel> destinations = result.docs
          .map((e) =>
              DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createDestination() async {
    try {
      for (var i = 0; i < destinations.length; i++) {
        _destinationRef.doc(const Uuid().v4()).set(destinations[i]);
      }
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }
}
