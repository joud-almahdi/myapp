import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/SignUp.dart';
import 'package:myapp/listLayout.dart';
import 'firebase_options.dart';
import 'Login.dart';
import 'listLayout.dart';

void main() {
  runApp(const MyApp());
}

//db = FirebaseFirestore.instance;
final items = List<String>.generate(20, (i) => "Item ${i + 1}");

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: new LoginScreen(),
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Deleted")));
            },
            background: Container(
              color: Colors.red,
              margin: EdgeInsets.all(9),
            ),
            child: Card(
                color: Colors.lightBlueAccent,
                margin: EdgeInsets.all(9),
                child: ListTile(title: Text('$item'))),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondRoute()));
        },
        child: Icon(Icons.add),
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


