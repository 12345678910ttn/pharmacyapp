import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'covid19.dart';

Future<String> _loadTownshipAsset() async{

  return await rootBundle.loadString('assets/res/Covid19News.json');
}

Future loadTownship() async {

  String jsonTownship = await _loadTownshipAsset();
  final jsonResponse = json.decode(jsonTownship);
  Township township = new Township.fromJson(jsonResponse);
  print(township.townshipname);
}