import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:test_technique_odc/core/providers/place_provider.dart';
import 'package:test_technique_odc/ui/screens/details_page.dart';
import '../../core/models/models.dart';
import '../../core/services/getAllPlaces.dart';
import '../config.dart';
import '../widgets/places_of_interest.dart';
import '../widgets/select_dropdown_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double numPlaces = 10;
  late List<Place> places;

  @override
  void initState() {
    super.initState();

    final dataProvider = Provider.of<PlaceProvider>(context, listen: false);
  }
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        height: context.height * 0.9,
        padding: EdgeInsets.only(top: context.topPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lucky Trip",
                  style: TextStyle(fontSize: context.height * 0.05),
                ),
                const Icon(Icons.settings),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlaceStatiqueDropDown(),
                    InkWell(
                      onTap: ()async{
                        await _getCurrentPosition();
                        Provider.of<PlaceProvider>(context,listen: false).updateLonLat(_currentPosition!.longitude, _currentPosition!.latitude);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.location_on_rounded),
                          Text("Use My Current Location "),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Places OF Interests (${context.read<PlaceProvider>().places.length})",
                        style: TextStyle(
                            fontSize: context.height * 0.025,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: context.height * 0.7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            context.watch<PlaceProvider>().places.isEmpty
                                ? const Text("data not loaded in provider")
                                : Column(
                                    children: [
                                      ...context
                                          .read<PlaceProvider>()
                                          .places
                                          .map((e) => PlaceOfInterest(place: e))
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
