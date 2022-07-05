import 'dart:convert';

import 'package:http/http.dart' as http;

class OfficesList {
  List<Office> offices; //Это массив
  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;

    //Необходимо пройтись по всем офисам и распасить каждый из них
    //map принимает каждый передаваемый элемент данных и применяет к нему некоторую функцию, после чего возвращает результат
    List<Office> officesList = officesJson
        .map((i) => Office.fromJson(i))
        .toList(); //Данные Json преобразовываются в наши собственные объекты

    OfficesList(offices: json['offices']);
    return OfficesList(
      offices: officesList,
    );
  }
}

class Office {
  final String name;
  final String address;
  final String image;


  Office({required this.name, required this.address, required this.image});

  //Фабричный конструктор JSON
  //Отвечает за десериализацию данных из JSON в данные нашего клааса Office
  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
        name: json['name'] as String,
        address: json['address'] as String,
        image: json['image'] as String);
  }
}

class Button {
    
}

//Метод Get-запроса на сервер
Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
