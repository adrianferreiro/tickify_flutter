import 'package:tickify_flutter/features/events/data/models/event_model.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

extension EventModelMapper on EventModel {
  EventEntity toEntity() {
    return EventEntity(
      id: id,
      title: title,
      description: description,
      date: date,
      active: active,
      agenda:
          agenda.map((item) {
            // Cast porque sabemos que todos son AgendaItemModel
            return (item as AgendaItemModel).toEntity();
          }).toList(),
    );
  }
}

extension AgendaItemModelMapper on AgendaItemModel {
  AgendaItem toEntity() {
    return AgendaItem(time: time, topic: topic);
  }
}

extension EventModelListMapper on List<EventModel> {
  List<EventEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}
