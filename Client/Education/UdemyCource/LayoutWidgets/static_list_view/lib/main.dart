import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          title: const Text(
            "Weather",
          ),
          centerTitle: true,
        ),
        body: _myListView(),
      ),
    );
  }
}

class BodyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(8),
    //shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemExtent: 300, //Чтобы не было ошибки из-за неизвестной ширины элемента
    //Если вертикальный лист вью - высота элемента
    //Если горизонтальный лист вью - ширина элемента 
    //Явное указание данного элемента повышает производитлеьность, т.к. Flutter не нужно  рассчитывать размер каждого элемента на основе его содержимого
    //reverse: true,
    children: const [
      ListTile(
        title: Text('Sun'),
        subtitle: Text('Today clear'),
        leading: Icon(Icons.wb_sunny),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(title: Text('Cloudly'),
        subtitle: Text('Today cloudly'),
        leading: Icon(Icons.wb_sunny),
        trailing: Icon(Icons.keyboard_arrow_right),),
      ListTile(title: Text('Rainy')),
      ListTile(title: Text('Snow')),
    ],
  );
}
