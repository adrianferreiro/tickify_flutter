import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/firebase_datasource_impl.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

///
/// [ticketDatasourceProvider] expose datasource
///
final ticketDatasourceProvider = Provider<TicketDatasource>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return FirebaseDatasourceImpl(firestore);
});
