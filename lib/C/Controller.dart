import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class Controller extends GetxController {
  String task_details = " ";
  var completed = false;
  String title = " ";
  String due_date = " ";

  CreateTask() {
    DocumentReference doc = FirebaseFirestore.instance
        .collection("TaskDataBase")
        .doc(title.toString());
    Map<String, String> todoList = {
      "TaskTitle": title.toString(),
      "TaskDescription": task_details.toString(),
      "ID": title.toString(),
      "date": due_date.toString(),
    };
    doc.set(todoList).whenComplete(() => print("SUCCESS"));
  }

  DeleteTask(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("TaskDataBase").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  UpdateTask(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("TaskDataBase").doc(item);

    documentReference
        .update({"TaskTitle": title, "TaskDescription": task_details});
  }

  updatetitle(String value) {
    title = value;
  }

  updatedetail(String value) {
    task_details = value;
  }

  updatedate(String value) {
    due_date = value;
  }
}
