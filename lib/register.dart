import 'package:flutter/material.dart';
import 'package:untitled11/student_root.dart';
import 'package:untitled11/teacher_root.dart';
class Registration extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(2), children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TeacherRootPage()
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            margin: EdgeInsets.all(10.0),
            child: const Center(
                child: Text(' Login as \nTEACHER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ))),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new StudentRootPage(),
                ),
          );
        },
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          margin: EdgeInsets.all(10.0),
          child: const Center(
            child: Text(' Login as \nSTUDENT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.white)),
          ),
        ),
      ),
    ]);
  }
}
