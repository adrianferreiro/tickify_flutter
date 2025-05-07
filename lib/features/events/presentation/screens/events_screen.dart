import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickify_flutter/features/events/presentation/providers/events_providers.dart';
import 'package:tickify_flutter/features/events/presentation/widgets/event_card.dart';

class EventsScreen extends StatelessWidget {
  static const name = 'events-screen';
  static const path = '/events';
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos')),
      body: const _BuildBody(),
    );
  }
}

class _BuildBody extends ConsumerWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(eventsProvider).isLoading;
    final events = ref.watch(eventsProvider).events;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (events != null) {
      return events.isEmpty
          ? const Text('No hay eventos para mostrar')
          : ListView.builder(
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              final event = events[index];
              return EventCard(event: event);
            },
          );
    }

    return const SizedBox();
  }
}
