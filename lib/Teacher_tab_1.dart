import 'package:flutter/material.dart';
import 'package:untitled11/qrpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'qrpage.dart';
// import 'package:qr_flutter/qr_flutter.dart';
class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  TextEditingController subcode1 = TextEditingController();

  String subcode =  " ";

  //var subcode = TextEditingController subcode1;

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
                      controller: subcode1,
                      onChanged: (value){
                         subcode = value;
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


                      if(subcode=="5IT222" || subcode=="5IT221"){
                        if(subcode=="5IT221") setState(() {
                          pic_value = "1";
                        });
                        else if(subcode=="5IT222") setState(() {
                          pic_value = "2";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QrPage()),
                        );
                      }else {
                        const snackBar = SnackBar(
                          content: Text('Please enter a valid subject code'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

    },
                        child: Text(
                          'Generate QR Code',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),


                      // const snackBar = SnackBar(
                      //   content: Text('QR CODE SCANNER WILL BE GENERATED'),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => StudentMain()));
                  ),// onPressed: (){
                    //   RepaintBoundary(
                    //     child: QrImage(
                    //       data: 'This is a simple QR code',
                    //       version: QrVersions.auto,
                    //       size: 320,
                    //       gapless: false,
                    //     ),
                    //   );
                    // },


                  ),
                ),

            ]
        ),
      ),
    );


  }

}

// final qrKey = GlobalKey();
// String qrData = 'Our Qr Data';
//RepaintBoundary is necessary for saving QR to user's phone

