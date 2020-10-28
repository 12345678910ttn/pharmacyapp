import 'dart:math';
//import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'covid19.dart';

class Covid19List extends StatefulWidget {
  final List<Covid19> covid19;

  Covid19List({this.covid19});

  @override
  _Covid19ListState createState() => _Covid19ListState(covid19: covid19);
}

class _Covid19ListState extends State<Covid19List> {
  final List<Covid19> covid19;
  List<TownshipGroup> covidi9Township = [];
  List<Covid19> filtercovid19 = new List<Covid19>();
  List<Covid19> filter2covid19 = [];

  int sum = 0;
  int grandSum = 0;
  final random = Random();
  _Covid19ListState({this.covid19});

  String getGrandTotal() {
    grandSum = 0;
    filtercovid19.forEach((covid) {
      covid.townships.forEach((twship) {
        grandSum = grandSum + twship.effectedcount;
      });
    });

    return grandSum.toString();
  }

  int getGroupTotal(int index) {
    sum = 0;
    filtercovid19[index].townships.forEach((element) {
      sum = sum + element.effectedcount;
    });
    return sum;
  }

  @override
  void initState() {
    setState(() {
      covid19.forEach((element) {
        filtercovid19.add(element);
      });
      for (int i = 0; i < covid19.length; i++) {
        for (int j = 0; j < covid19[i].townships.length; j++) {
          covidi9Township.add(new TownshipGroup(
              townshipname: covid19[i].townships[j].townshipname,
              effectedcount: covid19[i].townships[j].effectedcount,
              date: covid19[i].date));
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TOTAL COVID-19 CASES\n(MDY Region)',
          style: TextStyle(fontSize: 12),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Text(
                getGrandTotal(),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          /*   IconButton(
            
            icon: const Icon(Icons.add_alert,color: Colors.red,),
            tooltip: 'Effected Cases',
            onPressed: () {
            
            },
          ), */
          FlatButton(onPressed: null, child: Image.asset('assets/covid5.jpg'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              filtercovid19 = covid19
                                  .where((u) => u.date
                                      .toLowerCase()
                                      .contains(val.toLowerCase()))
                                  .toList();
                              getGrandTotal();
                            });
                          },
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15, right: 5),
                            labelText: "Enter Date Eg.24-10-2020",
                            fillColor: Colors.blue,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                          )),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 3.2 / 4,
              child: new ListView.builder(
                  itemCount: filtercovid19 == null ? 0 : filtercovid19.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Card(
                        child: new Container(
                            height: 200,
                            child: new Row(
                              // Stretch the cards in horizontal axis
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/covid3.jpg'),
                                  radius: 50,
                                  child: Text(
                                    filtercovid19[index].date +
                                        "\nCases-" +
                                        getGroupTotal(index).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  foregroundColor: Colors.white70,
                                ),
                              
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    // height: 200,
                                    width: MediaQuery.of(context).size.width *
                                        1.1 /
                                        2,
                                    child: ListView.builder(
                                      itemCount:
                                          filtercovid19[index].townships.length,
                                      itemBuilder:
                                          (BuildContext context, int index1) {
                                        return new Card(
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  topRight: Radius.circular(50),
                                                  bottomLeft:
                                                      Radius.circular(50),
                                                  bottomRight:
                                                      Radius.circular(50)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.blue
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3.0),
                                                  child: new Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0,
                                                              right: 5),
                                                      child: Text(
                                                        filtercovid19[index]
                                                            .townships[index1]
                                                            .townshipname,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: new TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.black87,
                                                          fontFamily:
                                                              "Pyidaungsu",
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange[100],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(30),
                                                              topRight: Radius
                                                                  .circular(30),
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          30)),
                                                    ),
                                                  ),
                                                ),
                                                new Container(
                                                  // width: 30,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      filtercovid19[index]
                                                          .townships[index1]
                                                          .effectedcount
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: new TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black87,
                                                        fontFamily:
                                                            "Pyidaungsu",
                                                      ),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.pink[300],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    30)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                /*                Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, left: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 200,
                                                    height: 40,
                                                    child: Center(
                                                      child: new Text(
                                                        // Read the name field value and set it in the Text widget
                                                        covid19[index].date,
                                                        // set some style to text
                                                        style: new TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.black87,
                                                          fontFamily: "Pyidaungsu",
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(30),
                                                          topRight: Radius.circular(30),
                                                          bottomLeft: Radius.circular(30),
                                                          bottomRight: Radius.circular(30)),
                                                    ),
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                           
                                          ],
                                        ), */
                              ],
                            ),
                            //padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 8,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
