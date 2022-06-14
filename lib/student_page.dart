import 'dart:developer';
import 'dart:io';
import 'form2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'form.dart';

String? result1=0 as String?;
class StudentMain extends StatefulWidget {
   StudentMain({Key? key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const QRViewExample(),
                          ));



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

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  String? result1;
  Barcode? result;

   void setvar(){
    result1 = result?.code;

  }
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            //print(result1);
                            if(result!.code=="5IT221")
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Form1()),);


                            else if(result!.code=="5IT222")
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Form2()),);
                              //Navigator.pushNamed(context, 'WorldView()');
                            else{
                             const snackBar = SnackBar(
                             content: Text('QR CODE SCANNER WILL BE GENERATED'),
                             );
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                       },

                          child: Text('navigate'),
    ),
    )
    ],
    ),
    ],
    ),
    ),
    )
    ],
    ),
    );
    }

    Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
    MediaQuery.of(context).size.height < 400)
    ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
    key: qrKey,
    onQRViewCreated: _onQRViewCreated,
    overlay: QrScannerOverlayShape(
    borderColor: Colors.red,
    borderRadius: 10,
    borderLength: 30,
    borderWidth: 10,
    cutOutSize: scanArea),
    onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
    }

    void _onQRViewCreated(QRViewController controller) {
    setState(() {
    this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
    setState(() {
    result = scanData;
    });
    });
    }

    void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('no Permission')),
    );
    }
    }

    @override
    void dispose() {
    controller?.dispose();
    super.dispose();
    }
    }


class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }}

