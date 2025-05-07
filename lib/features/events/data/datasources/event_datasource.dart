import 'package:tickify_flutter/features/events/data/models/event_model.dart';

abstract class EventDatasource {
  Future<EventModel> getAllEvents();
}
