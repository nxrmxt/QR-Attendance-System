import 'package:flutter/material.dart';
import 'package:untitled11/student_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';

class StudentRootPage extends StatefulWidget {
  const StudentRootPage({Key? key}) : super(key: key);

  @override
  _StudentRootPageState createState() => _StudentRootPageState();
}
    late SharedPreferences sharedPreferences;
class _StudentRootPageState extends State<StudentRootPage> {
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
                      child: Image.asset('images/Student.png', width: 300, height: 300,)),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PRN',
                      hintText: 'Enter valid PRN'),
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
                      hintText: 'Enter secure password',

                  ),
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
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => StudentMain()));
                    String id = idController.text.trim();
                    String password = passController.text.trim();


                    if (id.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Student id is still empty"),
                    ));
                    } else if (password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Password is still empty"),
                    ));
                    } else {
                      print(id);
                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection("Student")
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
                                context, MaterialPageRoute(builder: (_) => StudentMain()))
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
                            error = "Student id does not exist";
                          });
                        } else {
                          setState(() {
                            error = "Error occurred";
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error),
                            )
                        );
                      }

                      //print(snap.docs[0]['password']);
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
