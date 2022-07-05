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
          body: Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Icon(Icons.airplay, color: Colors.red, size: 200),
              Positioned(
                top: 30,
                left: 2,
                child: Text(
                  'Телевизор',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          )),
    );
  }
}
