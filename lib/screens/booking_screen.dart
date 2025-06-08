import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCourt;
  final List<String> _courts = [
    'Padel Court A',
    'Padel Court B',
    'Padel Court C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book a Court')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Select Court'),
                value: _selectedCourt,
                items:
                    _courts.map((court) {
                      return DropdownMenuItem(value: court, child: Text(court));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCourt = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a court';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process booking
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking Successful!')),
                      );
                      Navigator.pop(context); // Navigate back to Home Screen
                    }
                  },
                  child: Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
