class TicketEntity {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String identifier;
  final bool attended;
  final String eventId;

  TicketEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.identifier,
    required this.attended,
    required this.eventId,
  });
}
