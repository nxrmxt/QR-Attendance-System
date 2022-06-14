import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.pink,
            title: const Text(
              "Smart Attendance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Registration()),
    );
  }
}
