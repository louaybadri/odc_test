
import 'package:flutter/material.dart';
import 'package:test_technique_odc/core/services/getPlaceDetails.dart';
import 'package:test_technique_odc/ui/config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/models/place_details.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.id, required this.name}) : super(key: key);
  final String id;
  final String name;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<PlaceDetails> futurePlaceDetails;

  @override
  void initState() {
    super.initState();
    futurePlaceDetails = getPlaceDetails(widget.id);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // color: Colors.red,
          height: context.height,
          padding: EdgeInsets.only(top: context.topPadding),
          child: Column(
            children: [
              AppBarDetails(name: widget.name),
              SizedBox(
                height: context.height * 0.7,
                child: FutureBuilder<PlaceDetails>(
                  future: futurePlaceDetails,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return (Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          snapshot.data!.preview!=null ?Image.network(snapshot.data!.preview!.source!,width: context.width*0.5):const Text("Photo Not FOund"),
                          Text(snapshot.data!.kinds??""),
                          Text(snapshot.data!.wikipediaExtracts?.text??""),
                          Text(snapshot.data!.name??""),
                          InkWell(
                              onTap:(){
                                print(snapshot.data?.wikipedia!);
                    },
                              child: const Text("Visit Wikipedia")),
                          ],
                      ));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              )
            ],
          )),
    );
  }
}

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({
    super.key, required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: context.height * 0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text("Lucky Trip"),
              ],
            ),
          ),
          SizedBox(
            width: context.width*0.5,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(name,
                  style: TextStyle(
                      fontSize: context.height * 0.03,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
