import 'package:flutter/material.dart';

class StudentMain extends StatefulWidget {
  const StudentMain({Key? key}) : super(key: key);

  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Smart Attendance'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          FlatButton(
              onPressed: () {  },
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
              //onPressed: signOut)

      ),
  ],
      ),

    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                  width: 400,
                  height: 60,
                  alignment: Alignment(100, 20),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    shape: BoxShape.rectangle,
                    //borderRadius: BorderRadius.circular(15),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  child: const Center(
                    child: Text(
                      'Hello Student' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),



            Container(
                margin: new EdgeInsets.only(top: 40, bottom: 40),
                width: 320.0,
                height: 380.0,
                //alignment: Alignment(100, 20),
                decoration: BoxDecoration(
                  //color: Colors.lightBlue[50],
                  shape: BoxShape.rectangle,
                  //borderRadius: BorderRadius.circular(25),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      topLeft: Radius.circular(35)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          const snackBar = SnackBar(
                            content: Text('QR CODE SCANNER WILL START'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          // margin: new  EdgeInsets.only(left: 10,right:10,top:10,bottom:30),
                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          width: 200,
                          margin: new EdgeInsets.only(top: 60, bottom: 10),
                          height: 80,
                          alignment: Alignment(50, 50),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.rectangle,
                            borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 30)),
                            //borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              '  Scan QR \n     Code',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      //new Text(status),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
