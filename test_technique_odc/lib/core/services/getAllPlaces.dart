import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/models.dart';

Future<List<Place>> getAllPlaces(double long, double lat) async {
  try {
    print("before http");
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print("after http");
    if (response.statusCode == 200) {
      print("object");
      var data = json.decode(response.body);
      print(data);
      // Print the fetched data
      late List<Place> places = [];
      for (var i = 0; i < response.body.length; i++) {
        places.add(Place.fromJson(jsonDecode(response.body[i])));
      }
      return places;
    } else {
      print("Error");
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("Error");
    throw Exception('Failed to load data');

  }
}
