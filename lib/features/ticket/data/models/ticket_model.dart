class TicketModel {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String identifier;
  final bool attended;
  final String eventId;

  TicketModel({
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
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      identifier: json['identifier'] as String,
      attended: json['attended'] as bool,
      eventId: json['eventId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'identifier': identifier,
      'attended': attended,
      'eventId': eventId,
    };
  }
}
