import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Application For Emergency Help',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashLogo(),
    );
  }
}
class SplashLogo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  SplashScreen (
      seconds: 14,
      navigateAfterSeconds: MainDashboard(),
      title: new Text('Welcome To Public Emergency',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
       image: new Image.network('https://flutter.io/images/catalog-widget-placeholder.png'),
      // backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Hello Public"),
      loaderColor: Colors.red,
      
    );
  }
}

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final list_item =[
    {
      "name":"Image 1",
      "pic": "pharmacy2.jpg",
      "price":"70"
    },
    {
      "name":"Image 2",
      "pic": "hospital.jpg",
      "price":"80"
    },
    {
      "name":"Image 3",
      "pic": "volunteer.png",
      "price":"60"
    },
    {
      "name":"Image 4",
      "pic": "covid.jpg",
      "price":"60"
    },
 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:Text("DASH BOARD (Mandalay Directory)"),
      ),
      body: Container(
        // color: Colors.blueAccent,
        child: GridView.builder(
          itemCount: list_item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context,int index){
            return Product(
              list_item[index]['name'],
               list_item[index]['pic'],
                list_item[index]['price']

            );
          },
          
        ),
        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    )
      ),
    );
  }
}
class Product extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_price;
  Product(this.product_name,this.product_pic,this.product_price);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Card(
          child: Hero(tag: product_name, 
          child:InkWell(
            onTap:(){},
            child:GridTile(child: Image.asset("assets/"+ product_pic),)
          )),
          
        ),
         decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    )
      ),
    );
  }
}