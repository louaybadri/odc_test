
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_technique_odc/core/models/models.dart';
import 'package:test_technique_odc/core/services/local_storage.dart';
import 'package:test_technique_odc/ui/config.dart';

import '../screens/details_page.dart';

class PlaceOfInterest extends StatefulWidget {
  const PlaceOfInterest({
    super.key, required this.place,
  });
  final Place place;

  @override
  State<PlaceOfInterest> createState() => _PlaceOfInterestState();
}

class _PlaceOfInterestState extends State<PlaceOfInterest> {
  late bool isFav = false;

  void isFavorite()async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList("fav");
    setState(() {
      isFav = favorites!.contains(widget.place.name);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey,width: 0.5,style: BorderStyle.solid))),
        width: context.width,
        height: context.height*0.15,
        // color: Colors.green,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.width*0.6,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: InkWell(
                                onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DetailsPage(id: widget.place.xid!, name: widget.place.name!,)),
                                    );

                                },
                                child: Text(widget.place.name??'Not Valid',style: TextStyle(fontSize: context.height*0.04),)))),
                    SizedBox(
                        width: context.width*0.8,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(widget.place.kinds??"Not Valid",style: TextStyle(fontSize: context.height*0.02)))),
                  ],
                ),
                 isFav?const Icon(Icons.star):InkWell(
                     onTap: ()async {

                       SharedPreferences prefs = await SharedPreferences.getInstance();
                       List<String>? items = prefs.getStringList("fav");
                       items ??= [];
                      print(widget.place.name!);
                      items.add(widget.place.name!);
                      print(items);
                      prefs.setStringList("fav", items);
                       setState(() {
                         isFav=!isFav;

                       }) ;
                     },
                     child: const Icon(Icons.star_border))
              ],
            ),
            Text(widget.place.dist!.toStringAsFixed(2))
          ],
        ));
  }
}
