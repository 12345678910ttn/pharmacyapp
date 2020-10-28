import 'dart:math';
//import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'covid19.dart';

class Covid19TownshipList extends StatefulWidget {
  final List<Covid19> covid19;

  Covid19TownshipList({this.covid19});

  @override
  _Covid19TownshipListState createState() =>
      _Covid19TownshipListState(covid19: covid19);
}

class _Covid19TownshipListState extends State<Covid19TownshipList> {
  final List<Covid19> covid19;
  List<TownshipGroup> covidi9Township = [];
  List<TownshipGroup> filtercovid19 = new List<TownshipGroup>();

  int sum = 0;
  int grandSum = 0;
  final random = Random();
  _Covid19TownshipListState({this.covid19});

  String getGrandTotal() {
    grandSum = 0;
    filtercovid19.forEach((covid) {
      grandSum = grandSum + covid.effectedcount;
    });

    return grandSum.toString();
  }

  /* int getGroupTotal(int index) {
    sum = 0;
   filtercovid19[index].townships.forEach((element) {
      sum = sum + element.effectedcount;
    });
    return sum;
  } */
  @override
  void initState() {
    
    setState(() {
      for (int i = 0; i < covid19.length; i++) {
        for (int j = 0; j < covid19[i].townships.length; j++) {
          covidi9Township.add(new TownshipGroup(
              townshipname: covid19[i].townships[j].townshipname,
              effectedcount: covid19[i].townships[j].effectedcount,
              date: covid19[i].date));
      
        }
      }
      covidi9Township.forEach((element) {
        filtercovid19.add(element);
      });
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
         /*  IconButton(
            icon: const Icon(
              Icons.add_alert,
              color: Colors.red,
            ),
            tooltip: 'Effected Cases',
            onPressed: () {},
          ), */
          FlatButton(onPressed: null, 
          child:Image.asset('assets/earthwithmask.jpg'))
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
                      width: MediaQuery.of(context).size.width * 3/4,
                      child: TextFormField(
                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.black87,
                                                          fontFamily: "Pyidaungsu",
                                                        ),
                          onChanged: (val) {
                             setState(() {
                                    filtercovid19 =covidi9Township
                                        .where((u) => u.townshipname
                                            .toLowerCase()
                                            .contains(val.toLowerCase()))
                                        .toList(); 
                                        getGrandTotal();
                                   
                                  });
                          },
                          decoration: new InputDecoration(
                            
                            contentPadding: EdgeInsets.only(left: 15, right: 5),
                            labelText: "Enter TownshipName",
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
                      padding: const EdgeInsets.only(top:5.0),
                      child: new Card(
                        child: new Container(
                            height: 50,
                            child: new Row(
                              // Stretch the cards in horizontal axis
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                
                                CircleAvatar(
                                  
                                  backgroundImage:
                                      AssetImage('assets/covid4.jpg',),
                                  radius: 30,
                                  child: Text(
                                    filtercovid19[index].effectedcount.toString() 
                                       ,
                                       textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  
                                  foregroundColor: Colors.white70,
                                ),
                                 Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: new Container(
                                                   
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(
                                                         10),
                                                      child: Text(
                                                        filtercovid19[index].townshipname
                                                           ,
                                                        textAlign: TextAlign.center,
                                                        style: new TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.black87,
                                                          fontFamily: "Pyidaungsu",
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.pink[100],
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomLeft:
                                                              Radius.circular(20),
                                                          bottomRight:
                                                              Radius.circular(20)),
                                                    ),
                                                  ),
                                                ),

                                                 Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: new Container(
                                                    
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(
                                                         10),
                                                      child: Text(
                                                        filtercovid19[index].date
                                                           ,
                                                        textAlign: TextAlign.center,
                                                        style: new TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.black87,
                                                          fontFamily: "Pyidaungsu",
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.pink[100],
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomLeft:
                                                              Radius.circular(20),
                                                          bottomRight:
                                                              Radius.circular(20)),
                                                    ),
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: new Container(
                                                   
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(
                                                         10),
                                                      child: Text(
                                                        filtercovid19[index].effectedcount.toString()
                                                           ,
                                                        textAlign: TextAlign.center,
                                                        style: new TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white,
                                                          fontFamily: "Pyidaungsu",
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red[900],
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20),
                                                          bottomLeft:
                                                              Radius.circular(20),
                                                          bottomRight:
                                                              Radius.circular(20)),
                                                    ),
                                                  ),
                                                ),
                               
                            
                              
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
