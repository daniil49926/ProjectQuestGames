import 'dart:async';

import 'package:flutter/material.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

//Класс состояний. Именно он служит объектом State.
//Теперь мы можем вызывать метод build для перерисовки пользовательского интерфейса столько, сколько нам нужно
//Как только изменяем объект State -> Flutter обновляет содержимого любого StatefulWidget`а, подключённого к нему
//Нижнее подчёркивание _ идентифицирует приватные значения. Состояния виджетов принято оставлять приватными
class _MyFirstAppState extends State<MyFirstApp> {
  //В этих динамических переменных мы будем хранить состояние
  late bool _loading;
  late double _progressValue;

  /*
  void _change_loading_state() {
    setState(() {
      _loading = !_loading;
    });
  }
  */

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState(); //метод суперкласса
  }

  @override
  Widget build(BuildContext context) {
    //context - особый тип объекта, который будет автоматически передан в метод сборки
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
              child: _loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          LinearProgressIndicator(value: _progressValue ),
                          Text(
                            '${(_progressValue * 100).round()}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ])
                  : const Text(
                      'Press Button to download',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue == 1.0) {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
