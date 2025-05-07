import 'package:flutter/material.dart';
import 'package:tickify_flutter/features/events/domain/entities/event_entity.dart';

class EventCard extends StatelessWidget {
  final EventEntity event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
              const Divider(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                itemCount: event.agenda.length,
                itemBuilder: (BuildContext context, int index) {
                  final agenda = event.agenda[index];
                  return Card(
                    color: colors.surface,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(agenda.topic), Text(agenda.time)],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
