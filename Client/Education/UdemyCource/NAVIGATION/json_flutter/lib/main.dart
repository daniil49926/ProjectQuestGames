import 'dart:convert';

import 'package:flutter/material.dart';

import 'config.dart';

void main() {
  runApp(
    MaterialApp(
      //CUPERTINO
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Manual JSON Serialization"),
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
    ),


  );

  Map ourJson = jsonDecode(loadConfig() as String);
  print(ourJson['first_entry']);
  print('werewrwerwerwerwer');
}
