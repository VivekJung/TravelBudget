import 'package:TravelBudget/Screens/newTrips/budgetView.dart';
import 'package:flutter/material.dart';
import 'package:TravelBudget/models/Trips.dart';

class NewTripDateView extends StatelessWidget {
  final Trip trip;
  NewTripDateView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController _titleController = TextEditingController();
    // _titleController.text = trip.title;

    return Scaffold(
      appBar: AppBar(title: Text('Plan your Trip | Duration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A trip to: ${trip.title}',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'When will you start?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'When will it end?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                trip.startDate = DateTime.now();
                trip.endDate = DateTime.now();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewTripBudgetView(trip: trip)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
