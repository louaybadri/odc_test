import 'package:flutter/material.dart';
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
  late Future<List<Place>> futurePlaces;
  late List<Place> places;

  @override
  void initState() {
    super.initState();
    futurePlaces = getAllPlaces(0, 0);

    final dataProvider = Provider.of<PlaceProvider>(context, listen: false);
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlaceStatiqueDropDown(),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text("Use My Current Location "),
                      ],
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
                                          .map((e) => InkWell(
                                          onTap: (){
                                            Navigator.push(
                                              context,

                                              MaterialPageRoute(builder: (context) => DetailsPage(id: e.xid!, name: e.name!,)),
                                            );
                                          },
                                          child: PlaceOfInterest(place: e)))
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
