import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:publicpharmacyapp/Covid/covid19.dart';
import 'package:publicpharmacyapp/Covid/covid19List.dart';

class HomeNewsForCovid extends StatefulWidget {
  @override
  HomeNewsForCovidState createState() => new HomeNewsForCovidState();
}

class HomeNewsForCovidState extends State<HomeNewsForCovid> {
  List data = List();
  int grouptotal = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
          /*  appBar: new AppBar(
            title: new Text( "Mandalay Region",
            style: new TextStyle(color: Colors.white),),
          ), */
        
          body:
              new Container(
                child: new Center(
                  // Use future builder and DefaultAssetBundle to load the local JSON file
                  child: new FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/res/Covid19News.json'),
                      builder: (context, snapshot) {
                        List<Covid19> countries =
                            parseJosn(snapshot.data.toString());

                        return countries.isNotEmpty
                            ? new Covid19List(covid19: countries)
                            : new Center(child: new CircularProgressIndicator());
                      }),
                ),
              ),

       
          ),
    );
  }

  List<Covid19> parseJosn(String response) {
    if (response == null) {
      return [];
    }

    final parsed =
        // json.decode(response.toString()).cast<Map<String,List<dynamic>>>();
        json.decode(response.toString());
    /*   Covid19 c19 = new Covid19.fromJson(parsed);
         print(c19.townships[1]); */
    return parsed.map<Covid19>((json) => new Covid19.fromJson(json)).toList();
    //return  new Covid19.fromJson(parsed).toList();
  }
}
