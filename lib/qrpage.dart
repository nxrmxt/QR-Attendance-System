import 'package:flutter/material.dart';
import 'Teacher_tab_1.dart';
import 'package:untitled11/qrpage.dart';

String pic_value = "0";

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 300,
                        height: 250,
                        /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('images/qrcode$pic_value.jpeg', width: 300, height: 300,)),
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}
