import 'package:flutter/material.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyFirstApp());


class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в меьод сборки
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Building Layouts"),
          centerTitle: true,
        ),
        body: const Align(
          alignment: Alignment(0.5, 0.5),
          child: Text(
            'Some text',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 26),
          ),
        ),
      ),
    );
  }
}
