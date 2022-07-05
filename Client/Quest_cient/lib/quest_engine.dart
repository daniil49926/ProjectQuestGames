import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quest_cient_v2/Config.dart';

import 'DirectLoading/DirectLoding.dart';
import 'config_parser.dart';

class QuestEnginePage extends StatefulWidget {
  //const QuestEnginePage({Key? key}) : super(key: key);
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<QuestEnginePage> {
  //Map data2 = Loader();

  Map data = directLoaderCaptainClark(); //as Map можно и не писать
  late String button1text;
  late String button2text;
  late String button3text;
  late String button4text;

  int scores = 0;

  late String questText;
  late var qurrentPart;

  _nextPart(String buttonnumber) {
    questText = questText +
        "\n\n->" +
        data["book"]["Chapter1"][qurrentPart]["buttons"]["button1"]["name"] +
        "\n";

    qurrentPart =
        data["book"]["Chapter1"][qurrentPart]["buttons"][buttonnumber]["goto"];

    if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button1"]["end"] !=
        null) {
      if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button1"]["end"] ==
          "GOOD") {
        scores = data["Description"]["scores"] as int;
        //print("111111111111111111111111111111111111111111111");
        //print(scores);
      }
    }

    if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button1"] != null) {
      button1text =
          data["book"]["Chapter1"][qurrentPart]["buttons"]["button1"]["name"];
    } else {
      button1text = "";
    }
    if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button2"] != null) {
      button2text =
          data["book"]["Chapter1"][qurrentPart]["buttons"]["button2"]["name"];
    } else {
      button2text = "";
    }
    if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button3"] != null) {
      button3text =
          data["book"]["Chapter1"][qurrentPart]["buttons"]["button3"]["name"];
    } else {
      button3text = "";
    }
    if (data["book"]["Chapter1"][qurrentPart]["buttons"]["button4"] != null) {
      button4text =
          data["book"]["Chapter1"][qurrentPart]["buttons"]["button4"]["name"];
    } else {
      button4text = "";
    }
    questText =
        questText + "\n" + data["book"]["Chapter1"][qurrentPart]["text"];
  }

  @override
  void initState() {
    qurrentPart = "part1";

    if (data["book"]["Chapter1"]["part1"]["buttons"]["button1"] != null) {
      button1text =
          data["book"]["Chapter1"]["part1"]["buttons"]["button1"]["name"];
    } else {
      button1text = "";
    }
    if (data["book"]["Chapter1"]["part1"]["buttons"]["button2"] != null) {
      button2text =
          data["book"]["Chapter1"]["part1"]["buttons"]["button2"]["name"];
    } else {
      button2text = "";
    }
    if (data["book"]["Chapter1"]["part1"]["buttons"]["button3"] != null) {
      button3text =
          data["book"]["Chapter1"]["part1"]["buttons"]["button3"]["name"];
    } else {
      button3text = "";
    }
    if (data["book"]["Chapter1"]["part1"]["buttons"]["button4"] != null) {
      button4text =
          data["book"]["Chapter1"]["part1"]["buttons"]["button4"]["name"];
    } else {
      button4text = "";
    }
    questText = data["book"]["Chapter1"]["part1"]["text"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, scores);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.orange[700],
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: constraints.maxWidth,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/QuestFon.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(questText,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18)),
                      ),
                    ),
                  ),
                ),

                Divider(thickness: 12),
                Divider(thickness: 12),

                //Кнопка 1
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.brown.withOpacity(0.5),
                            onTap: () {
                              setState(() {
                                if (data["book"]["Chapter1"][qurrentPart]
                                        ["buttons"]["button1"] !=
                                    null) {
                                  _nextPart("button1");
                                }
                              });
                            },
                            child: Ink(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/ButtonFon.png",
                                      height: 50),
                                  Center(
                                    child: Text(button1text,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Кнопка 2
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.brown.withOpacity(0.5),
                            onTap: () {
                              setState(() {
                                if (data["book"]["Chapter1"][qurrentPart]
                                        ["buttons"]["button2"] !=
                                    null) {
                                  _nextPart("button2");
                                }
                              });
                            },
                            child: Ink(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/ButtonFon.png",
                                      height: 50),
                                  Center(
                                    child: Text(button2text,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Кнопка 3
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.brown.withOpacity(0.5),
                            onTap: () {
                              setState(() {
                                if (data["book"]["Chapter1"][qurrentPart]
                                        ["buttons"]["button3"] !=
                                    null) {
                                  _nextPart("button3");
                                }
                              });
                            },
                            child: Ink(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/ButtonFon.png",
                                      height: 50),
                                  Center(
                                    child: Text(button3text,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Кнопка 4
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.brown.withOpacity(0.5),
                            onTap: () {
                              setState(() {
                                if (data["book"]["Chapter1"][qurrentPart]
                                        ["buttons"]["button4"] !=
                                    null) {
                                  _nextPart("button4");
                                }
                              });
                            },
                            child: Ink(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                      fit: BoxFit.fitWidth,
                                      "images/ButtonFon.png",
                                      height: 50),
                                  Center(
                                    child: Text(button4text,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
