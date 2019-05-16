import 'package:flutter/material.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("THÔNG TIN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          height: 600,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 100,
                width: 100,
                child: Image.asset('ava.png'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Bui Van Xia",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text("Admin at Dich va Viet hoa Vuong Gia Vinh Dieu",
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('facebook.png', fit: BoxFit.contain),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                    ),
                    child: Icon(Icons.call, size: 30, color: Colors.white,),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent
                    ),
                    child: Icon(Icons.mail, size: 30, color: Colors.white,),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent
                    ),
                    child: Icon(Icons.bug_report, size: 30, color: Colors.white,),
                  ),
                  SizedBox(width: 20,),
                ],
              ), // Row
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Support & Donate",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('paypal.png', fit: BoxFit.contain),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('momo.jpg', fit: BoxFit.scaleDown),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Sponsored By",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 150,
                    child: Image.asset('flutter.png', fit: BoxFit.contain),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('dart.png', fit: BoxFit.scaleDown),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

