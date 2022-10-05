import 'main.dart';
import 'package:flutter/material.dart';

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
