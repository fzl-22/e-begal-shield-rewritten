import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Stream<Map<String, DatabaseEvent>> getData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DatabaseReference latitudeRef = ref.child("latitude");
    DatabaseReference longitudeRef = ref.child("longitude");

    return Rx.combineLatest2(
      latitudeRef.onValue,
      longitudeRef.onValue,
      (DatabaseEvent latitude, DatabaseEvent longitude) {
        return {
          "latitude": latitude,
          "longitude": longitude,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return Text(
                  'Latitude: ${snapshot.data!["latitude"]?.snapshot.value.toString() ?? "N/A"}\n'
                  'Longitude: ${snapshot.data!["longitude"]?.snapshot.value.toString() ?? "N/A"}',
                  style: const TextStyle(color: Colors.red, fontSize: 40),
                );
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
