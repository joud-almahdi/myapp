import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/main.dart';
import '../C/Controller.dart';

var thecontroller = Get.put(Controller());
late Color taskcolor = Colors.black;

//maybe will make it for viewing tasks and ticking them
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                // var date = DateTime.parse(documentSnapshot!["date"].toString());
                //print(documentSnapshot!["date"]);
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    thecontroller.DeleteTask((documentSnapshot != null)
                        ? (documentSnapshot["ID"])
                        : "");
                    ;
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
                      title: Text(
                        (documentSnapshot != null)
                            ? (documentSnapshot["TaskTitle"])
                            : "",
                        style: TextStyle(color: taskcolor),
                      ),
                      subtitle: Text((documentSnapshot != null)
                          ? (documentSnapshot["TaskDescription"])
                          : ""),
                      trailing: TextButton(
                          onPressed: () {
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Update Task"),
                                    content: Container(
                                      width: 400,
                                      height: 100,
                                      child: Column(
                                        children: [
                                          TextField(
                                            onChanged: (String value) {
                                              thecontroller.updatetitle(value);
                                            },
                                          ),
                                          TextField(
                                            onChanged: (String value) {
                                              thecontroller.updatedetail(value);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            thecontroller.UpdateTask(
                                                (documentSnapshot != null)
                                                    ? (documentSnapshot[
                                                        "TaskTitle"])
                                                    : "");

                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Update"))
                                    ],
                                  );
                                },
                              );
                            }
                            ;
                            ;
                          },
                          child: Text("Update")),
                    ),
                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Task"),
                  content: Container(
                    width: 400,
                    height: 200,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (String value) {
                            thecontroller.updatetitle(value);
                          },
                        ),
                        TextField(
                          onChanged: (String value) {
                            thecontroller.updatedetail(value);
                          },
                        ),
                        TextFormField(
                          initialValue: DateTime.now().toString(),
                          onChanged: (String value) {
                            thecontroller.updatedate(value);
                          },
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          thecontroller.CreateTask();
                          thecontroller.updatedate(DateTime.now().toString());
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
