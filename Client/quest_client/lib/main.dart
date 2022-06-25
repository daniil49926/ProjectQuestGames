import 'package:flutter/material.dart';
import 'config_parser.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 10,
                child:
                    Image.asset(fit: BoxFit.fill, "images/Капитан Кларк.png")),
            Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(fit: BoxFit.fitWidth, "images/Fon1-1.png"),
                  Container(
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.centerLeft,
                      children: [
                        //Фон панельки
                        //Positioned Был добавлен для теста, его можно убрать
                        Positioned(child: Image.asset(fit: BoxFit.fitWidth, "images/Fon1-1.png"),
                         top: 0, right: 0),
                        //Строка с кнопками
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Кнопка настроек
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {},
                                child: Ink(
                                  child: Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/icons/settings.png",
                                      width: 45),
                                ),
                              ),
                            ),
                            //Кнопка общего количества очков
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {},
                                child: Ink(
                                  child: Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/icons/raitings.png",
                                      height: 50), //аномалия с размером кнопки
                                ),
                              ),
                            ),

                            //Кнопка общего количества очков
                            //С полем, отображающим это количество
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.indigoAccent.shade100),
                              ),
                              child: Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor:
                                          Colors.brown.withOpacity(0.5),
                                      onTap: () {},
                                      child: Ink(
                                        child: Image.asset(
                                            fit: BoxFit.fitHeight,
                                            "images/icons/scores.png",
                                            height: 50),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Кнопка связи с разработчиками (сердечко)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {},
                                child: Ink(
                                  child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/icons/heart.png",
                                    height: 45,
                                  ),
                                ),
                              ),
                            ),

                            //Кнопка открытия магазина
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {},
                                child: Ink(
                                  child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/icons/quests.png",
                                    height: 48,
                                  ),
                                ),
                              ),
                            ),

                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {},
                                child: Ink(
                                  child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/icons/back_button.png",
                                    height: 48,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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
              style:
                  TextStyle(color: Colors.deepPurpleAccent[600], fontSize: 18),
            ),
            IconButton(
                onPressed: _increment,
                icon: Icon(Icons.add),
                color: Colors.deepPurpleAccent[600]),
          ]),
    );
  }
}

