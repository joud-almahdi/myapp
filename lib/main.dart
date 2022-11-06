import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/SignUp.dart';
import 'package:myapp/listLayout.dart';
import 'firebase_options.dart';
import 'Login.dart';
import 'listLayout.dart';
import 'C/Controller.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//db = FirebaseFirestore.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: snackbarKey,
      title: 'To-do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: new LoginScreen(),
    );
  }
}



//widget for viewing tasks in detail



//class for adding tasks (most likely for deleting)
/**
 * class ViewTask extends StatelessWidget
 * {
 * }
 * 
 */

//class for login

/**
 * class Login extends StatelessWidget
 * override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Colors.lightBlueAccent,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()));
                },
                child: const Text('Open route'),
          
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 200, color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }
 */

//class for authentication
/**
 * class signup extends StatelessWidget
 * {
 * override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Colors.lightBlueAccent,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()));
                },
                child: const Text('Open route'),
          
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 200, color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }
 * }
 */


