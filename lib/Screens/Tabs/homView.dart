import 'package:TravelBudget/SupportClass/Trips.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  final List<Trip> tripList = [
    Trip('Kathmandu', DateTime.now(), DateTime.now(), 5000.00, 'Bike'),
    Trip('Pokhara', DateTime.now(), DateTime.now(), 10000.00, 'Plane'),
    Trip('Kalinchowk', DateTime.now(), DateTime.now(), 2000.00, 'Trek'),
    Trip('Dhankuta', DateTime.now(), DateTime.now(), 12000.00, 'Air'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tripList.length,
        itemBuilder: (BuildContext context, int index) =>
            buildTripCard(context, index),
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripList[index];
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(
                  children: [
                    Text(
                      trip.title,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 80),
                child: Row(
                  children: [
                    Text(
                        "${DateFormat('dd MMM, yyyy').format(trip.startDate).toString()} - ${DateFormat('dd MMM, yyyy').format(trip.endDate).toString()}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Row(
                  children: [
                    Text(
                      "NPR ${trip.budget.toStringAsFixed(0)}",
                      style: TextStyle(fontSize: 40),
                    ),
                    Spacer(),
                    Text(trip.travelType),
                    Icon(Icons.bike_scooter),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
