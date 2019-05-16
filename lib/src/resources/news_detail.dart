import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';

Widget NewsContent(BuildContext context, DocumentSnapshot document){
  List<String> cate = [
    "THÔNG BÁO",
    "SỰ KIỆN",
    "CẬP NHẬT",
    "ADMIN"
  ];
  List<Color> colors = [
    Color(0xffc49257),
    Colors.deepOrange,
    Colors.blue,
    Colors.green
  ];
  return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[document['cate']],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(cate[document['cate']],
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),

      ),
      body: ListView(
        children: <Widget>[
          textTitle(document['title']),
          byWho(document['image'], colors[document['cate']]),
          showingContent(),
        ],
      )
  );
}

Widget textTitle(String title){
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 5, 15),
    child: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
  );
}

Widget byWho(String image, Color colors){
  return Container(
    margin: EdgeInsets.only(right: 80, bottom: 10),
    padding: EdgeInsets.only(left: 20),
    height: 60,
    width: 200,
    decoration: BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30)
      )
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors, width: 1.5),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.contain,
            )
          ),
        ),
        SizedBox(width: 10),
        Text("BY TENCENT GAME", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ))
      ],
    ),
  );
}

Widget showingContent(){
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Html(
      data: """
      <p>Thời gian bảo trì: <b>22/03/2019</b>.</br>
      Theo thông tin mới nhất từ trang chủ tencent thì chúng ta sẽ bảo trì vào ngày..
      </p>
    """,

    ),
  );
}