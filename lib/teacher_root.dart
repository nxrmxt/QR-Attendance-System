import 'package:flutter/material.dart';
import 'package:untitled11/register.dart';
import 'package:untitled11/teacher_page.dart';
import 'package:untitled11/teacher_root.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherRootPage extends StatefulWidget {
  const TeacherRootPage({Key? key}) : super(key: key);

  @override
  _TeacherRootPageState createState() => _TeacherRootPageState();
}
late SharedPreferences sharedPreferences;
class _TeacherRootPageState extends State<TeacherRootPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/Teacher.png'),
                    )),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                  controller: idController
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                  controller: passController
              ),
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async{
                  //   Navigator.push(
                  //       context, MaterialPageRoute(builder: (_) => TeacherHomePage()));

        String id = idController.text.trim();
    String password = passController.text.trim();


    if (id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Teacher id is still empty"),
      ));
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password is still empty"),
      ));
    } else {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Teacher")
          .where('id', isEqualTo: id)
          .get();
      try {
        if (password == snap.docs[0]['password']) {
          sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("studentId", id).then((
              _) =>
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TeacherHomePage()))
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Password"),
          ));
        }
      } catch (e) {
        String error = " ";
        //print(e.toString());

        if (e.toString() ==
            "RangeError (index): Invalid value: Valid value range is empty: 0") {
          setState(() {
            error = "Teacher Email does not exist";
          });
        } else {
          setState(() {
            error = "Error occured";
          });
        }
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error),
            )
        );
      }

      print(snap.docs[0]['password']);
    }},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),

              ),
          ),


  ]
        ),
      ),
    );

  }
}
