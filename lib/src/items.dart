import 'package:flutter/material.dart';

class Items extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TRANG CHỦ", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: null, delegate: null);
              }
          )
        ],
      ),
      body: testHeroWidget(),
    );
  }
}

Widget testHeroWidget(){
  return Hero(
      tag: 'firstTag',
      child: Container(
          width: 50,
          height: 100,
          color: Colors.redAccent
      )
  );
}