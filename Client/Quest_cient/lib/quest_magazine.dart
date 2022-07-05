import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quest_cient_v2/Config.dart';

import 'DirectLoading/DirectLoding.dart';
import 'config_parser.dart';

class MagazinePage extends StatefulWidget {
  //const QuestEnginePage({Key? key}) : super(key: key);
  @override
  _MagazinePageState createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
  //Map data2 = Loader();

  Map data = directLoaderCaptainClark(); //as Map можно и не писать
  late bool StartQuest;
  late bool CaptainCalrk;
  late bool AbandonedForest;
  late bool FirstFight;

  Map downloadedQuests = {
    "StartQuest": true,
    "CaptainClark": false,
    "AbandonedForest": false,
    "FirstFight": false,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, downloadedQuests);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.orange[700],
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        fit: BoxFit.fill,
                        "images/quest_images/Капитан Кларк.png",
                        width: 100,
                      ),
                      Container(
                        width: constraints.maxWidth * .4,
                        child: Text(
                          "Вам предстоит играть за капитана подводного батискафа - Кларка",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download_for_offline_sharp),
                        // tooltip: 'Download Quest',
                        onPressed: () {
                          setState(() {
                            downloadedQuests["CaptainClark"] = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        fit: BoxFit.fill,
                        "images/quest_images/Затерянный лес.png",
                        width: 100,
                      ),
                      Container(
                        width: constraints.maxWidth * .4,
                        child: Text(
                          "Череда странных событий разрушает жизнь героя. Нужно либо разобраться в происходящем, либо сдаться...",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download_for_offline_sharp),
                        // tooltip: 'Download Quest',
                        onPressed: () {
                          setState(() {
                            downloadedQuests["AbandonedForest"] = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        fit: BoxFit.fill,
                        "images/quest_images/Первый бой.png",
                        width: 100,
                      ),
                      Container(
                        width: constraints.maxWidth * .4,
                        child: Text(
                          "Вам предсоит играть за участников Первой Мировой Воны",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download_for_offline_sharp),
                        // tooltip: 'Download Quest',
                        onPressed: () {
                          setState(() {
                            downloadedQuests["FirstFight"] = true;
                          });
                        },
                      ),
                    ],
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
