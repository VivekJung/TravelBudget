import 'package:TravelBudget/Screens/newTrips/budgetView.dart';
import 'package:flutter/material.dart';
import 'package:TravelBudget/models/Trips.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

class NewTripDateView extends StatefulWidget {
  final Trip trip;
  NewTripDateView({Key key, @required this.trip}) : super(key: key);

  @override
  _NewTripDateViewState createState() => _NewTripDateViewState();
}

class _NewTripDateViewState extends State<NewTripDateView> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 5));

  //function to get datetime popup
  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 50),
    );
    // firstDate: new DateTime(2015),
    // lastDate: new DateTime(2020));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

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
              'A trip to: ${widget.trip.title}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            RaisedButton.icon(
              onPressed: () async {
                displayDateRangePicker(context);
              },
              icon: Icon(
                Icons.date_range_rounded,
                size: 24,
                color: Colors.white,
              ),
              color: Colors.green[700],
              label: Text(
                'Pick trip duration',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "${DateFormat('dd MMM, yyyy').format(_startDate).toString()} - ${DateFormat('dd MMM, yyyy').format(_endDate).toString()}"),
                  // Text(
                  //   'Starting on: ',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // Text(
                  //   'Ending on: ',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                widget.trip.startDate = _startDate;
                widget.trip.endDate = _endDate;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewTripBudgetView(trip: widget.trip)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
