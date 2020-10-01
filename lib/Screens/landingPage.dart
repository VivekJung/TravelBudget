import 'package:TravelBudget/Screens/Tabs/exploreView.dart';
import 'package:TravelBudget/Screens/Tabs/historyView.dart';
import 'package:TravelBudget/Screens/Tabs/homeView.dart';
import 'package:TravelBudget/Screens/newTrips/locationView.dart';
import 'package:TravelBudget/models/Trips.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    ExploreView(),
    HistoryView(),
  ];
  @override
  Widget build(BuildContext context) {
    final newTrip = Trip(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Budget'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewTripLocationView(trip: newTrip)),
              );
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
