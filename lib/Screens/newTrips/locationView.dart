import 'package:flutter/material.dart';
import 'package:TravelBudget/models/Trips.dart';

import 'dateView.dart';

class NewTripLocationView extends StatelessWidget {
  final Trip trip;
  NewTripLocationView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    _titleController.text = trip.title;

    return Scaffold(
      appBar: AppBar(title: Text('Plan your Trip | Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Give a location',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                controller: _titleController,
                autofocus: true,
              ),
            ),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                trip.title = _titleController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewTripDateView(trip: trip)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
