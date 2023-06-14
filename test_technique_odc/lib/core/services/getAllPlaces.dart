import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/models.dart';

Future<List<Place>> getAllPlaces(double long, double lat) async {
  try {
    print("before http");
    final response = await http.get(Uri.parse('https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=5000&lon=${long}&lat=${lat}&format=json'));
    print("after http");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Print the fetched data
      // print(data);
      late List<Place> places = [];
      for (var _data in data) {
        places.add(Place.fromJson(_data));

      }
      return places;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("Error"+e.toString());
    throw Exception('Failed to load data');

  }
}
