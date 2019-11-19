import 'package:flutter/material.dart';
import 'package:red_tape/Models/global.dart';
import 'package:red_tape/UI/invent_card.dart';

import 'Models/invention.dart';
import 'Models/user.dart';
import 'UI/category_card.dart';

void main() => runApp(RedTape());

class RedTape extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RedTape',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color inactive = Colors.black.withOpacity(0.3);
  Map activeTab = {
    0 : Colors.black,
    1 : Colors.black.withOpacity(0.3),
    2 : Colors.black.withOpacity(0.3)
  };
  int active;
  @override
  initState() {
    active = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: EdgeInsets.only(top: 40),
                //constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        margin: EdgeInsets.only(top: 30),
                        child: Text("Connect", style: mainBlackTitle)),
                      Container(
                        padding: EdgeInsets.all(30),
                          child: Row(children: <Widget>[
                        FlatButton(
                            child: Text("Inventions",
                                style: TextStyle(
                                    color: activeTab[0],
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                            onPressed: () {
                              if (active != 0) {
                                setState(() {
                                  activeTab[active] = inactive;
                                  active = 0;
                                  activeTab[active] = Colors.black;
                                });
                              }

                            }),
                        FlatButton(child: Text("Products", style: TextStyle(
                                    color: activeTab[1],
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)), onPressed: () {
                          if (active != 1) {
                                setState(() {
                                  activeTab[active] = inactive;
                                  active = 1;
                                  activeTab[active] = Colors.black;
                                });
                              }
                        }),
                        FlatButton(child: Text("Ideas", style: TextStyle(
                                    color: activeTab[2],
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)), onPressed: () {
                          if (active != 2) {
                                setState(() {
                                  activeTab[active] = inactive;
                                  active = 2;
                                  activeTab[active] = Colors.black;
                                });
                              }
                        })
                      ])),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: ListView(
                              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                              children: getInventions(),
                              scrollDirection: Axis.horizontal)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              margin: EdgeInsets.only(top: 50, bottom: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Text("Explore categories", style: blackButtonTitle),
                                GestureDetector(
                                  onTap: () {
                                    print("Show all");
                                  },
                                  child: Text("see all", style: seeAllButton),
                                )
                              ],)
                            ),
                            Container(
                              height: 105,
                              child: ListView(
                                padding: EdgeInsets.only(left: 30),
                                scrollDirection: Axis.horizontal,
                                children: getCategories()
                              )
                            )
                          ]
                        )
                      )      
                    ]))));
  }

  List<String> categoryNames = ["Tech", "Gadgets", "Accessories", "Health", "Medicine"];
  Map categoryIcons = {
    "Tech" : Icon(Icons.phonelink, color: Colors.white, size: 50),
    "Gadgets" : Icon(Icons.wb_incandescent, color: Colors.white, size: 50),
    "Accessories" : Icon(Icons.brush, color: Colors.white, size: 50),
    "Health" : Icon(Icons.directions_run, color: Colors.white, size: 50),
    "Medicine" : Icon(Icons.healing, color: Colors.white, size: 50),
  };

  List<Widget> getCategories() {
    List<Widget> categories = [];
    for (String category in categoryNames) {
      categories.add(CategoryCard(categoryName: category, categoryIcon: categoryIcons[category]));
    }
    return categories;
  }

  List<Widget> getInventions() {
    List<Widget> inventions = [];
    User kalle =
        new User("Kalle", "Hallden", [], AssetImage('lib/Assets/good.JPG'));
    for (int i = 0; i < 10; i++) {
      Invention invent = new Invention("Auto Computer", [kalle], [kalle], 0.65,
          "Tech", AssetImage('lib/Assets/laptop.png'));
      kalle.inventions.add(invent);
      inventions.add(InventCard(invention: invent, inventor: kalle));
    }
    return inventions;
  }
}
