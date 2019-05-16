import 'package:flutter/material.dart';
import 'package:vgvd/src/resources/hero_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ShowData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('heroes').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.access_time, size: 25,),
              Text(
                " Đang tải...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ],
          )
        );
        return ListView.separated(
          //itemExtent: 80.0,
          separatorBuilder: (context, index) => Divider(color: Colors.white,),
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) => _builderItems(context, snapshot.data.documents[index]),
        );
      },
    );
  }

  Widget _builderItems(BuildContext context, DocumentSnapshot document){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => heroDetail(context, document)));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Hiển thị Hình ảnh Minh họa của tướng
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
                image: DecorationImage(
                  image: NetworkImage(document['image']),
                  fit: BoxFit.contain,
                ),
              ),
              //child: Image.asset('ava.png'),
            ),

            //Dùng để hiện tên Anh Hùng và vị trí
            Container(
              width: 200,
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    document['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    document['positive'],
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),

            Container(
              height: 30,
              width: 30,
              //color: Colors.black,
              child : document['lane'] == 1 ? Image.asset('top_icon.png')
                  : document['lane'] == 2 ? Image.asset('middle_icon.png')
                  : document['lane'] == 3 ? Image.asset('bot_icon.png')
                  : document['lane'] == 4 ? Image.asset('jungle_icon.png')
                  : Image.asset('support_icon.png'),
            ),

            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: document['free_week'] == 1 ? Icon(Icons.star, color: Colors.redAccent,) : SizedBox(width: 20,),
            ),
          ],
        ),
      ),
    );
  }
}

Widget testHeroWidget(){
  return Hero(
      tag: null,
      child: Container(
        width: 50,
        height: 100,
        color: Colors.redAccent
      )
  );
}