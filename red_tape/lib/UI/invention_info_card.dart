import 'package:flutter/material.dart';
import 'package:red_tape/Models/global.dart';
import 'package:red_tape/Models/invention.dart';
import 'package:red_tape/Models/user.dart';

class InventionInfoCard extends StatelessWidget {
  final Invention invention;

  const InventionInfoCard({Key key, this.invention}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Inventors", style: smallTitle),
            userList(invention.inventors),
            Text("Investors", style: smallTitle),
            userList(invention.investors),
            Text("Progress", style: smallTitle),
            getPorgress(),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 3),
              padding: EdgeInsets.only(left: (300 * invention.progress).toDouble() - 10),
              child: Text((invention.progress * 100).toString() + "%", style: categoryTitle)
            ),
            Container(
                child: Row(children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: Icon(Icons.favorite_border, color: blueColor, size: 40),),
                      FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        //side: BorderSide(color: Colors.red)
                      ),
                      child: Container(),
                      onPressed: () {}),
                    ]
                  ),),
              Container(
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                    ],
                  ),
                  height: 50,
                  width: 225,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        //side: BorderSide(color: Colors.red)
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Read More", style: whiteTitle),
                            Icon(Icons.arrow_forward_ios, color: Colors.white)
                          ]),
                      onPressed: () {}))
            ]))
          ],
        ),
        height: 380,
        width: 330);
  }

  Widget getPorgress() {
    return Container(
      margin: EdgeInsets.only( top: 10),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                    ],
                  ),
            width: 300,
            height: 5
          ),
          Container(
            decoration: BoxDecoration(
                    color: Color(0xFFA6D5F2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
            width: (300 * invention.progress).toDouble(),
            height: 5
          )
        ]
      )
    );
  }

  Widget userList(List<User> users) {
    List<Widget> userList = [];
    for (User user in users) {
      userList.add(userCard(user));
    }
    return Container(
      height: 100,
      child: ListView(
      children: userList,
      scrollDirection: Axis.horizontal
    )
    );
  }

  Widget userCard(User user) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                    ],
                  ),
          height: 50,
          width: 50,
          child: ClipRRect(
    borderRadius: new BorderRadius.circular(8.0),
    child: Image(image: user.profilePic, fit: BoxFit.cover),),),
        Text(user.firstName + " " + user.lastName, style: namesSmall)
      ],)
    );
  }
}
