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
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 161, 136, 246),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.adjust,
                size: 50,
                color: Colors.red,
              ),
              Icon(
                Icons.adjust,
                size: 100,
                color: Colors.green,
              ),
              Icon(
                Icons.adjust,
                size: 50,
                color: Colors.lightBlue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
