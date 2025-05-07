import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/events/data/datasources/event_datasource.dart';
import 'package:tickify_flutter/features/events/data/datasources/firebase_event_datasource_impl.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

///
/// [eventDatasourceProvider] expose datasource
///
final eventDatasourceProvider = Provider<EventDatasource>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return FirebaseEventDatasourceImpl(firestore);
});
