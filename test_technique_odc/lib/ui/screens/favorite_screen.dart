import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_technique_odc/core/services/local_storage.dart';
import 'package:test_technique_odc/ui/config.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<String> favs=[];
  Future<List<String>> loadData()async {
    return await getData();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData().then((value) {
      setState(() {
        favs=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Center(child: Column(
        children: [
          ...favs.map((e) =>
              SizedBox(
                  width: context.width*0.9,
                  height: context.width*0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.width*0.6,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(e)),
                      ),
                      InkWell(
                          onTap: (){
                            deleteData(e);
                            setState(() {
                              favs.remove(e);
                            });
                          },
                          child: const Icon(Icons.star))
                    ],
                  )),)
        ],
      ),),
    );
  }
}
