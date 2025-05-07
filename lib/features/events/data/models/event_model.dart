import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.id,
    required super.title,
    required super.description,
    required super.date,
    required super.active,
    required super.agenda,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.parse(json['date']),
      active: json['active'] ?? false,
      agenda:
          (json['agenda'] as List<dynamic>? ?? [])
              .map((e) => AgendaItemModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'active': active,
      'agenda': agenda.map((e) => (e as AgendaItemModel).toJson()).toList(),
    };
  }

  factory EventModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EventModel.fromJson({...data, 'id': doc.id});
  }
}

class AgendaItemModel extends AgendaItem {
  const AgendaItemModel({required super.time, required super.topic});

  factory AgendaItemModel.fromJson(Map<String, dynamic> json) {
    return AgendaItemModel(
      time: json['time'] ?? '',
      topic: json['topic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'time': time, 'topic': topic};
  }
}
