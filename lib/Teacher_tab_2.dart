import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled11/after_tab.dart';
import 'Teacher_tab_1.dart';
import 'form2.dart';


String subcode =  " ";
String date =  " ";

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {


  //final _database = FirebaseDatabase.instance.ref();
  String _displayText = "Results go here";
  var pic_val = " ";
  TextEditingController subcode1 = TextEditingController();



  TextEditingController date1 = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _activeListeners();
  }

  // void _activeListeners(){
  //   _database.child('$subcode/$date').onValue.listen((event) {
  //        final Object? prn = event.snapshot.value;
  //        String prn1 = prn.toString();
  //    setState(() {
  //      _displayText = 'Present prn: $prn1';
  //    });
  //   });
    // var Description_Path = '${subcode}/${date}';
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Subject Code',
                        hintText: 'Enter valid subject code'),
                       controller: subcode1,
                    onChanged: (value){
                      subcode = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Date',
                        hintText: 'Enter Date'),
                    controller: date1,
                    onChanged: (value){
                      date = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.pink, borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        //print(_displayText);

                        if(subcode=="5IT222" || subcode=="5IT221"){
                          if(subcode=="5IT221") setState(() {
                            pic_val = "1";
                          });
                          else if(subcode=="5IT222") setState(() {
                            pic_val = "2";
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Tab2()),
                          );
                        }else {
                          const snackBar = SnackBar(
                            content: Text('Please enter a valid subject code'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      child: Text(
                        'Check Attendance',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),


                  ),
                ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
