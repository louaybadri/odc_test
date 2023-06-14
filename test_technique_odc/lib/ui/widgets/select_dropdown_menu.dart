import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_odc/core/models/models.dart';
import 'package:test_technique_odc/core/providers/place_provider.dart';
import 'package:test_technique_odc/core/services/getAllPlaces.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>[
  'Tunis',
  'Sousse',
  'Ariana',
  'Bizerte',
  "Sfax",
  "Manouba"
];
List<Point> points = [
  Point(lat: 36.8179, lon: 10.1793),
  Point(lat: 35.8330, lon: 10.6110),
  Point(lat: 36.8589, lon:10.1882),
  Point(lat: 44.34124, lon: 2.37950),
  Point(lat: 34.7396, lon:10.7604),
  Point(lat: 36.8113, lon: 10.0947),
];


class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key, required this.setPlaces});
  final Function setPlaces;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: PlaceStatiqueDropDown(),
        ),
      ),
    );
  }
}

class PlaceStatiqueDropDown extends StatefulWidget {
  const PlaceStatiqueDropDown({super.key});
  @override
  State<PlaceStatiqueDropDown> createState() => _PlaceStatiqueDropDownState();
}

class _PlaceStatiqueDropDownState extends State<PlaceStatiqueDropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          double long= points[list.indexOf(value)].lon!;
          double lat=  points[list.indexOf(value)].lat!;
          Provider.of<PlaceProvider>(context,listen: false).updateLonLat(long, lat);

        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
