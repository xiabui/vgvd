import 'package:flutter/material.dart';

class Translate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DỊCH THUẬT", style: TextStyle(color: Colors.black),),
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

    );
  }
}