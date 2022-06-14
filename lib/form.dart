import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled11/student_page.dart';


class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);

  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final database = FirebaseDatabase.instance.ref();
  int id=0;
  TextEditingController prn1 = TextEditingController();
  String prn =  " ";

  TextEditingController date1 = TextEditingController();
  String date =  " ";

  @override

  Widget build(BuildContext context) {
    final class_code = '5IT221';
    // final class_code = database.child('5IT221/');
    return Scaffold(
      appBar: AppBar(title:Text("Form 1")),
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
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PRN',
                      hintText: 'Enter correct PRN'),
                  controller: prn1,
                  onChanged: (value){
                    prn = value;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                      hintText: 'Date'),
                  controller: date1,
                  onChanged: (value) {
                    date = value;
                  }
                ),
              ),

              Padding(padding: EdgeInsets.all(20.0)),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                     try{

                       // await class_code.update({date+'/'+(id++).toString(): prn});
                       // await class_code.update({date+'/'+(id++).toString(): prn});
                       database.child("${class_code}/${date}");
                       final snapshot = await database.child("${class_code}/${date}").get();
                       // Object? thePRNs = snapshot.value;
                       Map<String, dynamic> thePRNs = {};
                       List thePRNsWrite = [];
                       try{
                         thePRNs = Map<String, dynamic>.from(snapshot.value as Map);
                         print(thePRNs);
                         // if(thePRNs.contains(prn)){
                         //   print("PRN Already exists");
                         //   return;
                         // }

                         // thePRNs.add(prn);
                       }
                       catch(e){
                         // thePRNs = [prn];
                       }
                       return;
                       DatabaseReference newPostRef = database.push();
                       await newPostRef.set(thePRNs);
                        return;

                     }catch(e){
                       print(e.toString());
                     }
                  },
                  child: Text(
                    'SUMBIT ATTENDANCE',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
