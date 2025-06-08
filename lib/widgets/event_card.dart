import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String availability;

  const EventCard({
    required this.title,
    required this.location,
    required this.date,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Location: $location'),
            Text('Date: $date'),
            Text(
              'Availability: $availability',
              style: TextStyle(
                color: availability == 'Available' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
