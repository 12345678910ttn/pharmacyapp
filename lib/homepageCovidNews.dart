import 'dart:convert';
import 'package:flutter/material.dart';
import 'affectedCase.dart';
import 'covidnews.dart';
/* void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: new MyApp(),
  ));
} */

class HomeNewsForCovid extends StatefulWidget {
  @override
  HomeNewsForCovidState createState() => new HomeNewsForCovidState();
}

class HomeNewsForCovidState extends State<HomeNewsForCovid> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Covid NEWS In Mandalay Region",
          style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/res/EffectedCase.json'),
                builder: (context, snapshot) {
                  List<AffectedCase> countries =
                      parseJosn(snapshot.data.toString());
                  return countries.isNotEmpty
                      ? new EffectedList(affectedCase: countries)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        ));
  }

  List<AffectedCase> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<AffectedCase>((json) => new AffectedCase.fromJson(json)).toList();
  }
}