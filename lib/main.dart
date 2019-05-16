import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'src/heroes.dart';
import 'src/news.dart';
import 'src/items.dart';
import 'src/translate.dart';
import 'src/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vương Giả Vinh Diệu",
      home: Home(),
      theme: ThemeData(fontFamily: 'Saigon'),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final options = [News(), Heroes(), Items(), Translate(), About()];

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: options[index],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xffc49257),
        selectedItemColor: Colors.orangeAccent,
        currentIndex: index,
        onTap: (int i){
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Trang chủ"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.polymer),
            title: Text("Anh hùng"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("Trang bị"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            title: Text("Dịch Linh Tinh"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Thông tin"),
          ),
        ]
      ),
    );
  }
}
