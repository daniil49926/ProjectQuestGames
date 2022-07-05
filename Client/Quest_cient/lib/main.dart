import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quest_cient_v2/Config.dart';
import 'package:quest_cient_v2/Quests.dart';
import 'package:quest_cient_v2/quest_magazine.dart';
import 'package:quest_cient_v2/register_form_page.dart';

//Наши файлы с классами
import 'config_parser.dart';
import 'quest_engine.dart';

//Для создания Stateless_widget нам необходимо создать класс
// Виждет - это объект, и для его создания необходим класс
void main() {
  runApp(MyApp());
  //Future<Config> config;
  //var S = loadConfig();
  //print(S);

  //final config = Config.fromJson();
  //String s = loadConfig() as String;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {
  late String start_image;
  late String start_text;

  late int scores;

  late Map downloadedQuests = {
    "StartQuest": true,
    "CaptainClark": false,
    "AbandonedForest": false,
    "FirstFight": false,
  };

  late Map questsImages = {
    "StartQuest": "images/quest_images/Вводный квест.png",
    "CaptainClark": "images/Капитан Кларк.png",
    "AbandonedForest": "images/quest_images/Затерянный лес.png",
    "FirstFight": "images/quest_images/Первый бой.png",
  };

  var questList = [
    "StartQuest",
    "CaptainClark",
    "AbandonedForest",
    "FirstFight"
  ];

  void _returnDataFromQuestEnginePage(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => QuestEnginePage());
    final result = await Navigator.push(context, route) as int;
    setState(() {
      scores = scores + result;
    });
  }

  void _returnDAtaFromMagazinePage(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => MagazinePage());
    final result = await Navigator.push(context, route) as Map;
    setState(() {
      downloadedQuests = result;
    });
  }

  @override
  void initState() {
    scores = 0;

    start_image = 'images/quest_images/Вводный квест.png';
    start_text = 'Вводный квест\nАвторы: Разработчики';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/quest_engine_page': (context) => QuestEnginePage(),
        '/register_form_page': (context) => RegisterFormPage(),
      },
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                //РАЗДЕЛ ПОСТЕРА
                InkWell(
                  onTap: () {
                    _returnDataFromQuestEnginePage(context);
                  },
                  child: Align(
                    //Размещение разддела постера на глобальном уровне
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * .92,
                      //color: Colors.blue,
                      child: Image.asset(fit: BoxFit.fill, "$start_image"),
                    ),
                  ),
                ),

                //РАЗДЕЛ НАВИГАЦИИ МЕЖДУ ПОСТЕРАМИ
                Positioned(
                  bottom: constraints.maxHeight * .08,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * .1,
                      decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Кнопка выбора предыдущего квеста (LEFT BUTTON)
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.brown.withOpacity(0.5),
                              onTap: () {
                                setState(() {
                                  for (var n in questList) {
                                    if (downloadedQuests[n] != false) {
                                      start_image = questsImages[n];
                                    }
                                    ;
                                  }
                                });
                              },
                              child: Ink(
                                child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/icons/next_button_left.png",
                                    width: 40),
                              ),
                            ),
                          ),
                          Text(
                            "$start_text",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          //Кнопка выбора следующего квеста (RIGHT BUTTON)
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.brown.withOpacity(0.5),
                              onTap: () {
                                setState(() {
                                  for (var n in questList) {
                                    if (downloadedQuests[n] != false) {
                                      start_image = questsImages[n];
                                    }
                                    ;
                                  }
                                });
                              },
                              child: Ink(
                                child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/icons/next_button_right.png",
                                    width: 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // РАЗДЕЛ НИЖНЕЙ ПАНЕЛИ С КНОПКАМИ
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * .08 + 12,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.centerLeft,
                      children: [
                        //Фон панельки
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                              fit: BoxFit.fitWidth, "images/Fon1-1.png"),
                        ),
                        //Строка с кнопками
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Кнопка настроек
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.brown.withOpacity(0.5),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/register_form_page');
                                  print("Register_page_tapped");
                                },
                                child: Ink(
                                  child: Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/icons/settings.png",
                                      width: 45),
                                ),
                              ),
                            ),
                            //Кнопка рейтинга
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
                              padding: const EdgeInsets.all(0),
                              /*decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.indigoAccent.shade100),
                              ),*/
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
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "$scores",
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
                                onTap: () {
                                  _returnDAtaFromMagazinePage(context);
                                },
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
                ),
              ],
            );
          },
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
