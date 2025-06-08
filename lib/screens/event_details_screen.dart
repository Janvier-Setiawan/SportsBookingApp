import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String availability;
  final String description;

  const EventDetailsScreen({
    required this.title,
    required this.location,
    required this.date,
    required this.availability,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            SizedBox(height: 16),
            Text(description, style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking');
                },
                child: Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
