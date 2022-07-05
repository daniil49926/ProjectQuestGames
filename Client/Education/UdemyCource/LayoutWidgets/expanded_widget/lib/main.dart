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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Expanded(
                flex: 4,
                child: Image.network('https://img3.akspic.ru/crops/1/9/5/6/6/166591/166591-bmw-legkovyye_avtomobili-sportkar-kompaktnyj_avtomobil-a_segmenta-720x1280.jpg', 
                fit: BoxFit.cover),
               ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.blueAccent,
                  child: Text('1'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.greenAccent,
                  child: Text('2'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.orange,
                  child: Text('3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
