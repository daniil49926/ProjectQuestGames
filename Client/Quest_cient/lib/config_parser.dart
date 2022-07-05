import 'dart:convert';

import 'dart:async' show Future; //Необходимо для загрузки файла config.json
import 'package:flutter/services.dart' show rootBundle;
import 'package:quest_cient_v2/Quests.dart';

/*
Future<String> _loadConfigAsset() async {
  return await rootBundle.loadString('data/config.json');
}

Future loadConfig() async {
  String jsonConfig = await _loadConfigAsset();
  //print(jsonConfig);
  //return Quest.fromJson(json.decode(jsonConfig)); //этой строки не было изначально
  return rootBundle.loadString(jsonConfig);
}

Future<String> getJson() {
  return rootBundle.loadString('data/config.json');
}
*/

Loader() async {
  String textData = await rootBundle.loadString('quests_text/Config.json');
  Map data = json.decode(textData);
  return data;
}


