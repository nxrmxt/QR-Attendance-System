import 'package:flutter/material.dart';
import 'package:untitled11/Teacher_tab_1.dart';
import 'package:untitled11/Teacher_tab_2.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.arrow_drop_down),
                text: "Take Attendance",
              ),
              Tab(icon: Icon(Icons.book), text: "View Records"),
            ],
          ),
          title: Text(
            ' Welcome Teacher',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: (){}),
          ],
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
          ],
        ),
      ),
    );
  }
}
