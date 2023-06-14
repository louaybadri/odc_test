import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../models/place_details.dart';

Future<PlaceDetails> getPlaceDetails(String id) async {
  try {
    print("before http");
    final response = await http.get(Uri.parse('https://api.opentripmap.com/0.1/en/places/xid/${id}?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9'));
    print("after http");
    if (response.statusCode == 200) {

      var data = json.decode(response.body);
      print(data);
      final PlaceDetails result = PlaceDetails.fromJson(data);
      print(result.preview!.source);
      return result;
    } else {
      throw Exception('Data doesnt match Failed to load data');
    }
  } catch (e) {
    print("Error"+e.toString());
    throw Exception('Failed to load data');

  }
}
