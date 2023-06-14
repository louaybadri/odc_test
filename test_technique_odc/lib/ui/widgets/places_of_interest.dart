
import 'package:flutter/material.dart';
import 'package:test_technique_odc/core/models/models.dart';
import 'package:test_technique_odc/ui/config.dart';

class PlaceOfInterest extends StatelessWidget {
  const PlaceOfInterest({
    super.key, required this.place,
  });
  final Place place;
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
                            child: Text(place.name??'Not Valid',style: TextStyle(fontSize: context.height*0.04),))),
                    SizedBox(
                        width: context.width*0.8,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(place.kinds??"Not Valid",style: TextStyle(fontSize: context.height*0.02)))),
                  ],
                ),
                const Icon(Icons.star_border)
              ],
            ),
            Text(place.dist!.toStringAsFixed(2))
          ],
        ));
  }
}
