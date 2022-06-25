import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //CUPERTINO
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("My First App"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("This is My Homepage",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    ),
  ));
}
