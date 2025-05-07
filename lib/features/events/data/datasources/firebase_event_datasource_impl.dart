import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickify_flutter/features/events/data/datasources/event_datasource.dart';
import 'package:tickify_flutter/features/events/data/models/event_model.dart';

class FirebaseEventDatasourceImpl implements EventDatasource {
  final FirebaseFirestore _firestore;

  FirebaseEventDatasourceImpl(this._firestore);

  @override
  Future<EventModel> getAllEvents() {
    // TODO: implement getAllEvents
    throw UnimplementedError();
  }
}
