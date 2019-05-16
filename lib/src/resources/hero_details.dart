import 'package:flutter/material.dart';
import 'package:vgvd/src/ads_show.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String testDevice = '';

Widget heroDetail(BuildContext context, DocumentSnapshot document) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black, ),
      title: Text(
        document['name'],
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          DetailScreenTopPart(
            document['image'],
            document['name'],
            document['positive'],
            document['lane'],
            document['survival'],
            document['attack'],
            document['skill'],
            document['difficult'],
            90,
          ),
          DetailAppBar(),

        ],
      ),
    ),
  );
}

class DetailScreenTopPart extends StatelessWidget {
  DetailScreenTopPart(
      this.image, this.name, this.pos, this.lane,
      this.survival,this.attack, this.skill, this.difficult,
      this._widthText);
  final String image;
  final String name;
  final String pos;
  final int lane;
  final double _widthText;
  final int survival, attack, skill, difficult;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: Stack(
        children: <Widget>[
          Image.asset('hau_nghe_bg.jpg',
              fit: BoxFit.cover, width: double.infinity),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0x00000000),
                  const Color(0xD9333333),
                ],
                stops: [
                  0.0,
                  0.9,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: _widthText,
                        child: Text(
                          "Survival",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: survival.toDouble(),
                        height: 5,
                        color: Color(0xff4b7a1f),
                      )
                    ],
                  ),


                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: _widthText,
                        child: Text(
                          "Attack",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: attack.toDouble(),
                        height: 5,
                        color: Color(0xffaf4b3d),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: _widthText,
                        child: Text(
                          "Skill",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: skill.toDouble(),
                        height: 5,
                        color: Color(0xff406db5),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: _widthText,
                        child: Text(
                          "Difficult",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: difficult.toDouble(),
                        height: 5,
                        color: Color(0xff9f7441),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class DetailAppBar extends StatefulWidget{
  @override
  _DetailAppBarState createState() =>  _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar>{
  bool story = false, details = false;
  Color borderColor = Colors.brown;
  int _selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double haft = width *0.5;
    return Container(
      width: double.infinity,
      height: 600,
      child: Stack(
        children: <Widget>[
          Container(
            height: 40,
            child: GestureDetector(
              onTap: (){
                print("User tapped!");
              },
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black12, width: 0.7)
                        )
                    ),
                    width: haft,
                    child: Center(
                      child: Text("Story",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black12, width: 0.7)
                        )
                    ),
                    width: haft,
                    child: Center(
                      child: Text("Details",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}



































