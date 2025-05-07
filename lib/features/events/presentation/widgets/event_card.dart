import 'package:flutter/material.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

class EventCard extends StatelessWidget {
  final EventEntity event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: textstyle.titleLarge?.copyWith(color: colors.primary),
            ),
            Text(event.date.toString().substring(0, 10)),
            Text(event.description),
          ],
        ),
      ),
    );
  }
}
