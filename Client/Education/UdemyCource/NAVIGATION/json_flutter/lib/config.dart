import 'dart:convert';

import 'dart:async' show Future; //Необходимо для загрузки файла config.json
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadConfigAsset() async {
  return await rootBundle.loadString('data/config.json');
}

Future loadConfig() async {
  String jsonConfig = await _loadConfigAsset();

  print(jsonConfig);
  //return Quest.fromJson(json.decode(jsonConfig)); //этой строки не было изначально
  return jsonConfig;
}
