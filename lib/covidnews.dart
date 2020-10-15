import 'package:flutter/material.dart';
import 'affectedCase.dart';
class EffectedList extends StatelessWidget {

   final List<AffectedCase> affectedCase;
  EffectedList({Key key, this. affectedCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: affectedCase == null ? 0 : affectedCase.length,
        itemBuilder: (BuildContext context, int index) {
          return
                new Card(
                  child: new Container(
                    child: new Center(
                        child: new Column(
                      // Stretch the cards in horizontal axis
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          // Read the name field value and set it in the Text widget
                          affectedCase[index].date,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                            affectedCase[index].townshipname + "-" + affectedCase[index].effectedCount.toString(),
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.black87,fontFamily: "Pyidaungsu"),
                        ),
                       
                      ],
                    )),
                    padding: const EdgeInsets.all(15.0),
                  ),
             );
        });
  }
}