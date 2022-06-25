import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Center(
      child: Text(
        'Hello, Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 217, 73, 73)),
      ),
    ),
  ));
}

