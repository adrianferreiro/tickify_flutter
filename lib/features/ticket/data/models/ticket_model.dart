import 'package:cloud_firestore/cloud_firestore.dart';

class TicketModel {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String identifier;
  final bool attended;
  final String eventId;

  const TicketModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.identifier,
    required this.attended,
    required this.eventId,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      identifier: json['identifier'] ?? '',
      attended: json['isAssistence'] ?? false,
      eventId: json['eventId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'identifier': identifier,
      'isAssistence': attended,
      'eventId': eventId,
    };
  }

  factory TicketModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TicketModel.fromJson({...data, 'id': doc.id});
  }
}
