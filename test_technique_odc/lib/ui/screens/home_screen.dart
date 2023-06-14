import 'package:flutter/material.dart';
import '../../core/models/models.dart';
import '../../core/services/getAllPlaces.dart';
import '../config.dart';
import '../widgets/places_of_interest.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double numPlaces = 10;
  late Future<List<Place>> futurePlaces;

  @override
  void initState() {
    super.initState();
    futurePlaces = getAllPlaces(0, 0);
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
              "Lucky Trip", style: TextStyle(fontSize: context.height * 0.05),),
            const Icon(Icons.settings),
          ],
        ),
        Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("SELECT A CITY"),
            Row(
              children: const [
                Icon(Icons.location_on_rounded),
                Text("Use My Current Location "),
              ],
            ),
          ],
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Places OF Interests ($numPlaces)", style: TextStyle(
            fontSize: context.height * 0.025, fontWeight: FontWeight.bold)),
        SizedBox(
          height: context.height * 0.7,
          child: SingleChildScrollView(
            child: Column(
              children: [

              FutureBuilder<List<Place>>(
                future: futurePlaces,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.length.toString());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),

            // PlaceOfInterest(),
            // PlaceOfInterest(),
            // PlaceOfInterest(),
            // PlaceOfInterest(),
            // PlaceOfInterest(),
            // PlaceOfInterest(),
            // PlaceOfInterest(),
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
