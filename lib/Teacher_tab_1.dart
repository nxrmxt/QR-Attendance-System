import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
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
                padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Subject Code',
                      hintText: 'Enter valid subject code'),
                ),
              ),  

              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                      hintText: 'Enter date in dd mm yy format'),
                ),
              ),

              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Teacher ID',
                      hintText: 'Enter a valid Teacher ID'),
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
                      const snackBar = SnackBar(
                        content: Text('QR CODE SCANNER WILL BE GENERATED'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => StudentMain()));
                    },
                    // onPressed: (){
                    //   RepaintBoundary(
                    //     child: QrImage(
                    //       data: 'This is a simple QR code',
                    //       version: QrVersions.auto,
                    //       size: 320,
                    //       gapless: false,
                    //     ),
                    //   );
                    // },

                    child: Text(
                      'Generate QR Code',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

final qrKey = GlobalKey();
String qrData = 'Our Qr Data';
//RepaintBoundary is necessary for saving QR to user's phone

