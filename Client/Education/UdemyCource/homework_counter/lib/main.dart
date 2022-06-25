import 'package:flutter/material.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в меьод сборки
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          title: const Text("Counter"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(100),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Type "-" to decrement',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                  CounterWidget(),
                  const Text(
                    'Type "+" to increment',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    _counter = 50;
    super.initState();
  }

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  void _decrement() {
    setState(() {
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в метод сборки
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue[50]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: _decrement,
                icon: Icon(Icons.remove),
                color: Colors.deepPurpleAccent[600]),
            Text(
              '$_counter',
              style: TextStyle(color: Colors.deepPurpleAccent[600], fontSize: 18),
            ),
            IconButton(
                onPressed: _increment,
                icon: Icon(Icons.add),
                color: Colors.deepPurpleAccent[600]),
          ]),
    );
  }
}
