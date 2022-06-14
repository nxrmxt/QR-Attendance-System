import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled11/Teacher_tab_2.dart';
import 'package:untitled11/qrpage.dart';
import '';

var description;

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  final dref = FirebaseDatabase.instance.ref();
  final myTopPostQuery = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;
  // showData(){
  //   dref.once().then((snapshot){
  //     print(snapshot.previousChildKey);
  //   });

Future<void> shoeTemperature() async {
  // final databaseRef = await FirebaseDatabase.instance.ref().child('5IT221').child('12-06-22');
  // databaseRef.once().then((DataSnapshot snapshot){
  //   Map <dynamic, dynamic> values = snapshot.values;
  //   values.forEach((key, value) {
  //     print(value);
  //   });
  // });
}

@override
void initState(){
  super.initState();
  activeListners();
}

void activeListners()
{
  dref.child(subcode).child(date).onValue.listen((event) {
    // for(int i=0; i<; i++) {
    //   final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //   var description = data[(i).toString()] as String;
    //   setState(() {
    //     print('Data: ${description}' + ' Data Length: ${date.length}');
    //   });
    // }
    print(event.snapshot.value);

  });

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: (){
            activeListners();
          },
          child: Text("Press Here"),
        )
      ),
    );
  }
}
