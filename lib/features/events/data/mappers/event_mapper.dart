import 'package:tickify_flutter/features/events/data/models/event_model.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

/// Mapea un solo EventModel a EventEntity
extension EventModelMapper on EventModel {
  EventEntity toEntity() {
    return EventEntity(
      id: id,
      title: title,
      description: description,
      date: date,
      active: active,
      agenda:
          agenda.map((item) => (item as AgendaItemModel).toEntity()).toList(),
    );
  }
}

/// Mapea un solo AgendaItemModel a AgendaItem
extension AgendaItemModelMapper on AgendaItemModel {
  AgendaItem toEntity() {
    return AgendaItem(time: time, topic: topic);
  }
}

/// Mapea una lista de EventModel a una lista de EventEntity
extension EventModelListMapper on List<EventModel> {
  List<EventEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}
