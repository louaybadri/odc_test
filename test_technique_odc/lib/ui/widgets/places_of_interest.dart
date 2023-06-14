
import 'package:flutter/material.dart';
import 'package:test_technique_odc/ui/config.dart';

class PlaceOfInterest extends StatelessWidget {
  const PlaceOfInterest({
    super.key,
  });

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
                    Text("Medina",style: TextStyle(fontSize: context.height*0.04),),
                    Text("tags tags  tags  tags  ",style: TextStyle(fontSize: context.height*0.02)),
                  ],
                ),
                const Icon(Icons.star_border)
              ],
            ),
            const Text("123 KM ")
          ],
        ));
  }
}
