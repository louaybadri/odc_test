import 'package:flutter/material.dart';
import 'package:test_technique_odc/ui/config.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
          height: context.height,
          padding: EdgeInsets.only(top: context.topPadding),
          child: Column(
            children: [
              const AppBarDetails(),
              SizedBox(
                height: context.height*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // Image.network('https://picsum.photos/250?image=9'),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),

                  ],
                ),
              )
            ],
          )),
    );
  }
}

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height*0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start  ,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.arrow_back_ios),
              Text("Lucky Trip"),
            ],
          ),
          Text("Medina",style: TextStyle(fontSize: context.height*0.03,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
