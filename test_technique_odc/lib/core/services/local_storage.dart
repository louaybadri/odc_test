
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addData(String str) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items = prefs.getStringList("fav");
  if (items != null) {
    items.add(str);
    prefs.setStringList('fav', items);
  } else {
    prefs.setStringList('fav', <String>[str]);
  }
}
Future<void> clearAllData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("fav");
}

Future<void> deleteData(str) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items =  prefs.getStringList("fav");
  if(items != null){
    if (items.remove(str)){
      prefs.setStringList('fav',items );
    }
  }else{
    prefs.setStringList('fav',[]);
  }
}

Future<void> initData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getStringList("fav")==null)
  prefs.setStringList("fav", []);
}
Future<List<String>> getData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items =  prefs.getStringList("fav");
  if(items != null){
    return items;
  }else{
    prefs.setStringList("fav",   []);
    return [];
  }
}

