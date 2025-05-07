import 'package:flutter/material.dart';
import 'package:tickify_flutter/features/ticket/domain/entities/ticket_entity.dart';

class TikcetCard extends StatelessWidget {
  final TicketEntity ticket;
  const TikcetCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final bool attended = ticket.attended;
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surface,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ticket.email),
              Text(ticket.name),
              const Divider(),
              Text(
                attended ? 'Asistió' : 'No asistió',
                style: TextStyle(
                  color: attended ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
