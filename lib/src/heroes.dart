import 'package:flutter/material.dart';
import 'resources/hero_all.dart';

class Heroes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return tabs();
  }
}
Widget tabs() {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("ANH HÙNG", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
    body: ShowData(),
  );
}