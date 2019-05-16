import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './resources/news_detail.dart';
import 'package:meta/meta.dart';

class News extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: ListView(
        children: <Widget>[
          newsBody(),
          anotherNews()
        ],
      ),
    );
  }
}


Widget newsBody (){
  final double _width = 350;
  final double _height = 180;
  final double _radius = 18;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 20, top: 15),
        child: Text("Tin nóng",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: _width, height: _height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                  image: DecorationImage(
                      image: NetworkImage('https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/169/169-bigskin-1.jpg'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: _width, height: _height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                  image: DecorationImage(
                      image: NetworkImage('https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/169/169-bigskin-1.jpg'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: _width, height: _height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                  image: DecorationImage(
                      image: NetworkImage('https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/169/169-bigskin-1.jpg'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget anotherNews(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 15, left: 15),
        child: Text(
          "Thông tin chung",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 335,
          width: double.infinity,
          child: StreamBuilder(
            stream: Firestore.instance.collection('news').snapshots(),
            builder: (context, snapshot){
              return (!snapshot.hasData) ? Center(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.refresh, size: 20),
                    Text(" Please wait...", style: TextStyle(fontSize: 20),)
                  ],
                ),
              ) : ListView.builder(
                itemExtent: 169.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => _builderItems(context, snapshot.data.documents[index]),
              );
            },
          )
      ),//End of the first item
    ],
  );
}

Widget _builderItems(BuildContext context, DocumentSnapshot document){
  List<String> cate = [
    "[Thông báo]",
    "[Sự kiện]",
    "[Cập nhật]",
    "[ADMIN]"
  ];
  List<Color> colors = [
    Color(0xffc49257),
    Colors.deepOrange,
    Colors.blue,
    Colors.green
  ];

  Color generalColor = colors[document['cate']];
  String title = document['title'];
  double width = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsContent(context, document)));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: generalColor,
          border: Border.all(
            color: generalColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            width: width,
            child: Text(cate[document['cate']],
            style: TextStyle(
             color: Colors.white,
              fontSize: 20
            )),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: width*0.62,
                  padding: EdgeInsets.fromLTRB(15,15,5,15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title.length > 45 ? title.substring(0,45) + '...': title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, size: 15,),
                          SizedBox(width: 5,),
                          Text(document['posted_day'].toString(), style: TextStyle(fontSize: 15),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(document['image']),
                          fit: BoxFit.contain
                      )
                  ),
                )
              ],
            ),
          )
        ],
      )
    ),
  );
}
