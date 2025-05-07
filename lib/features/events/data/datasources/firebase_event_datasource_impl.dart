import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickify_flutter/features/events/data/datasources/event_datasource.dart';
import 'package:tickify_flutter/features/events/data/models/event_model.dart';

class FirebaseEventDatasourceImpl implements EventDatasource {
  final FirebaseFirestore _firestore;

  FirebaseEventDatasourceImpl(this._firestore);

  @override
  Future<List<EventModel>> getAllEvents() async {
    try {
      final snapshot = await _firestore.collection('events').get();

      return snapshot.docs.map((doc) => EventModel.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception('Error al obtener eventos: $e');
    }
  }
}
