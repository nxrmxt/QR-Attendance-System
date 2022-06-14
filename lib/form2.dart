import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled11/student_page.dart';

final database1 = FirebaseDatabase.instance.ref();
int id = 0;

//Future<int> receive_quantity() async{

  //var snapshot = await database1.child("5IT222".  ).once();
  //var result = snapshot.value; //get the value here
  //print(result);
  //return result;
//}
class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {

  final database = FirebaseDatabase.instance.ref();
  TextEditingController prn1 = TextEditingController();
  String prn =  " ";

  TextEditingController date1 = TextEditingController();
  String date =  " ";
  @override
  Widget build(BuildContext context) {
    final class_code = database.child('5IT222/');

    return Scaffold(
      appBar: AppBar(title:Text("Form 2")),
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
                onChanged: (value) {
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
                      id++;
                      await class_code.update({date+'/'+(id).toString(): prn} );

                    }catch(e){
                      print('you got an error!');
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
