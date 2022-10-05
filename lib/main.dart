import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/listLayout.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'To-do list- Home Page'),
    );
  }
}

//maybe will make it for viewing tasks and ticking them
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Card(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 7),
              elevation: 10.0,
              child: InkWell(
                child: Container(height: 200, color: Colors.lightBlueAccent),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()));
                },
              )),
          ListLayout()
        ],
      ),
    );
  }
}

//widget for viewing tasks

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 600, color: Colors.lightBlueAccent),
          )
        ]),
      ),
    );
  }
}

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

class ListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 7),
        elevation: 10.0,
        child: InkWell(
          child: Container(height: 200, color: Colors.lightBlueAccent),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRoute()));
          },
        ));
  }
}
