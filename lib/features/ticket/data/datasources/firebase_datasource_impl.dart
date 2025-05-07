import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickify_flutter/features/ticket/data/datasources/ticket_datasource.dart';
import 'package:tickify_flutter/features/ticket/data/models/ticket_model.dart';

class FirebaseDatasourceImpl extends TicketDatasource {
  final FirebaseFirestore _firestore;

  FirebaseDatasourceImpl(this._firestore);

  @override
  Future<TicketModel> validateTicket(String ticketId) async {
    try {
      final docRef = _firestore.collection('participants').doc(ticketId);

      // Marcar asistencia
      await docRef.update({'isAssistence': true});

      // Obtener los datos actualizados (opcional)
      final snapshot = await docRef.get();

      if (!snapshot.exists) throw Exception('Ticket no encontrado');

      final data = snapshot.data()!;
      return TicketModel.fromJson(data);
    } catch (e) {
      throw Exception('Error validando ticket: $e');
    }
  }
}
