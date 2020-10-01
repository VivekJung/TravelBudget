import 'package:flutter/material.dart';
import 'package:TravelBudget/models/Trips.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final Trip trip;
  NewTripBudgetView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plan your Trip | Costing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Estimate your budget',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text('Destination ${trip.title}'),
            Text('Starting on ${trip.startDate}'),
            Text('Ending on ${trip.endDate}'),
            RaisedButton(
              child: Text('Finish up!'),
              onPressed: () async {
                //save data to firebase firestore
                await db.collection('trips').add({
                  'trip': trip.title,
                  'startDate': trip.startDate,
                  'endDate': trip.endDate,
                });
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )
          ],
        ),
      ),
    );
  }
}
