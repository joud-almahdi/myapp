import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/SignUp.dart';
import 'package:myapp/listLayout.dart';
import 'firebase_options.dart';
import 'Login.dart';
import 'listLayout.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//db = FirebaseFirestore.instance;

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
  List tasks = List.empty();
  String task_details = " ";
  bool completed = false;
  String title = " ";
  String due_date = " ";

  @override
  void initState() {
    super.initState();
    tasks = ["Oh", "My"];
  }

  CreateTask() {
    DocumentReference doc =
        FirebaseFirestore.instance.collection("TaskDataBase").doc(title);
    Map<String, String> todoList = {
      "TaskTitle": title,
      "TaskDescription": task_details
    };
    doc.set(todoList).whenComplete(() => print("SUCCESS"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("TaskDataBase").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Object?>? documentSnapshot =
                    snapshot.data?.docs[index];
                final item = snapshot.data!.docs.length;
                return Dismissible(
                  key: Key(item.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      tasks.removeAt(index);
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
                      child: ListTile(
                        title: Text((documentSnapshot != null)
                            ? (documentSnapshot["TaskTitle"])
                            : ""),
                        subtitle: Text((documentSnapshot != null)
                            ? (documentSnapshot["TaskDescription"])
                            : ""),
                      )),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Task"),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          onChanged: (String value) {
                            task_details = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            CreateTask();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//widget for viewing tasks in detail

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
            child: Container(height: 200, color: Colors.lightBlueAccent),
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


