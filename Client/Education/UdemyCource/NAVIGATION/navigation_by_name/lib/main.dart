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
        appBar: AppBar(
          title: const Text("Nаvigator_simple"),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
      routes: {
        '/page2': (context) => Page2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Перейти на окно 2"),
        onPressed: () {
          Navigator.pushNamed(context, '/page2');
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      appBar: AppBar(
        title: Text("СТРАНИЦА 2"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Вернуться назад"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
