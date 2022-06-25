import 'package:flutter/material.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в меьод сборки
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("MyFirstApp"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LinearProgressIndicator(value: 23),
                  Text(
                    '23%',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Press Button to download',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }
}
