import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Padel Court A',
      'location': 'City Center',
      'date': 'May 10, 2025',
      'availability': 'Available',
      'description': 'A premium padel court located in the heart of the city.',
    },
    {
      'title': 'Padel Court B',
      'location': 'West Park',
      'date': 'May 12, 2025',
      'availability': 'Fully Booked',
      'description': 'A spacious court surrounded by greenery in West Park.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => EventDetailsScreen(
                        title: events[index]['title']!,
                        location: events[index]['location']!,
                        date: events[index]['date']!,
                        availability: events[index]['availability']!,
                        description: events[index]['description']!,
                      ),
                ),
              );
            },
            child: EventCard(
              title: events[index]['title']!,
              location: events[index]['location']!,
              date: events[index]['date']!,
              availability: events[index]['availability']!,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/booking');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
