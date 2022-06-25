import 'package:flutter/material.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в меьод сборки
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'IndieFlower', //Изменение шрифта на уровне приложения
      ),
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("MyFirstApp"),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(image: AssetImage('assets/images/bg.jpg')),
              Image.asset('assets/icons/icon.png'),
              const Positioned(
                top: 16,
                left: 115,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      // fontFamily: 'IndieFlower'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
