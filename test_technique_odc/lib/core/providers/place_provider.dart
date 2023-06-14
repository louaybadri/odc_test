import 'package:flutter/material.dart';
import 'package:test_technique_odc/core/services/getAllPlaces.dart';

import '../models/models.dart';

class PlaceProvider with ChangeNotifier {
  double _lon=10.63699;
  double _lat=35.82539;
  double get lon => _lon;
  double get lat => _lat;
  List<Place> _places = [];
  List<Place> get places => _places;
  PlaceProvider() {
    initData();
  }




  Future<void> initData() async {
    _places = await getAllPlaces(_lon, _lat);
    notifyListeners();
  }

  Future<void> updateLonLat(double lon,double lat)async{

    _lon=lon;
    _lat=lat;
    notifyListeners();
    initData();
    notifyListeners();
  }
}