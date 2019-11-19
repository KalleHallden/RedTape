import 'package:flutter/material.dart';
import 'package:red_tape/Models/global.dart';
import 'package:red_tape/Models/invention.dart';

import 'invention_info_card.dart';

class InventionPage extends StatefulWidget {
  final Invention invention;

  const InventionPage({Key key, this.invention}) : super(key: key);

  @override
  _InventionPageState createState() => _InventionPageState();
}

class _InventionPageState extends State<InventionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(backgroundColor: blueColor, elevation: 0),
        body: Container(
      decoration: BoxDecoration(
          color: blueColor,
          gradient: RadialGradient(
            center: const Alignment(1.5, -0.9), // near the top right
            radius: 1.3,
            colors: [
              const Color(0xFFFFFFFF), // yellow sun
              blueColor, // blue sky
            ],
            stops: [0.1, 1.0],
          )),
      child: Center(
          child: Container(
              child: Column(children: <Widget>[
        Container(
            constraints: BoxConstraints.expand(height: 120),
            child: Row(children: <Widget>[
              FlatButton(
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ])),
        Image(
          image: widget.invention.image,
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          constraints: BoxConstraints.expand(height: 35),
          child: Text(widget.invention.name,
              style: whiteTitle, textAlign: TextAlign.start),
        ),
        InventionInfoCard(invention: widget.invention)
      ]))),
    ));
  }
}
