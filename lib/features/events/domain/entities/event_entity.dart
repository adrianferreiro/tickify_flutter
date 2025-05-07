class EventEntity {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool active;
  final List<AgendaItem> agenda;

  const EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.active,
    required this.agenda,
  });
}

class AgendaItem {
  final String time;
  final String topic;

  const AgendaItem({required this.time, required this.topic});
}
