import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:publicpharmacyapp/Covid/covid19.dart';
import 'package:publicpharmacyapp/Covid/covid19List.dart';
import 'package:publicpharmacyapp/Covid/covid19TownshipList.dart';
import 'package:http/http.dart' as http;

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.circle_notifications)),
                Tab(icon: Icon(Icons.remove_red_eye_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Container(
                child: new Center(
                  // Use future builder and DefaultAssetBundle to load the local JSON file
                  child: new FutureBuilder<List<Covid19>>(
                      future: fetchAlbum(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Covid19> countries = snapshot.data;

                          return new Covid19List(covid19: countries);
                        } else {
                          return Center(child: new CircularProgressIndicator());
                        }
                      }),
                ),
              ),
              new Container(
                child: new Center(
                  // Use future builder and DefaultAssetBundle to load the local JSON file
                  child: new FutureBuilder<List<Covid19>>(
                      future: fetchAlbum(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Covid19> countries = snapshot.data;

                          return new Covid19TownshipList(covid19: countries);
                        } else {
                          return Center(child: new CircularProgressIndicator());
                        }
                      }),
                ),
              ),
            ],
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
    print(parsed);
    /*   Covid19 c19 = new Covid19.fromJson(parsed);
         print(c19.townships[1]); */
    return parsed.map<Covid19>((json) => new Covid19.fromJson(json)).toList();
    //return  new Covid19.fromJson(parsed).toList();
  }

  Future<List<Covid19>> fetchAlbum() async {
    final response =
        await http.get('http://myglobaltechmyanmar.com/Covid19News.json');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      // return Covid19.fromJson(jsonDecode(response.body));
      return jsonResponse.map((job) => new Covid19.fromJson(job)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
/* List<Covid19> fetchAlbum1() async {
  final response = await http.get('http://myglobaltechmyanmar.com/Covid19News.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
     final parsed =
        // json.decode(response.toString()).cast<Map<String,List<dynamic>>>();
        json.decode(response.toString());
    return parsed.map<Covid19>((json) => new Covid19.fromJson(json)).toList();;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
} */

}
