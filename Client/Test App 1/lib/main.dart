import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp( //Возвращаем один объект меода build
        theme: ThemeData(primarySwatch: Colors.red), //Тема приложения
        home: Scaffold( // В этом одном объекте лежит много виджетов
          //Но в home возвращается один объект, поэтому используем контейнер
          appBar: AppBar(
            title: Text('Quest Multiverse'),
            centerTitle: true,),
          body: Center(
            child: Text('HelloWorld', style: TextStyle(
                fontSize: 26,
                color: Colors.amber,
                fontFamily: 'Times New Roman')),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { 
              print('Clicked');
            },
            child: Text('Нажми на меня',
            textAlign: TextAlign.center,),
            backgroundColor: Colors.blue,
          ),
        ),
      );
  }
}