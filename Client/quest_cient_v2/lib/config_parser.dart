import 'dart:async' show Future; //Необходимо для загрузки файла config.json
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadConfigAsset() async {
  return await rootBundle.loadString('data/config.json');
}

Future loadConfig() async {
  String jsonConfig = await _loadConfigAsset();
  print(jsonConfig);
  return jsonConfig; //этой строки не было изначально
}

