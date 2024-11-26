import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Future<void>shared()async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  pref.setString('key', 'sinan');
  pref.getString('key');

}


@HiveType(typeId:0)
class Model {
  @HiveField(0)
  String? name;

  Model({
    required this.name
  });
}