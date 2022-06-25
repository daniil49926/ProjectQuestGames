import 'dart:convert';

//import 'package:http/http.dart' as http;

class Quest {
  Description? description;
  Book? book;

  Quest({this.description, this.book});

  Quest.fromJson(Map<String, dynamic> json) {
    description = json['Description'] != null
        ? new Description.fromJson(json['Description'])
        : null;
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    print(description);
  }
}

class Description {
  String? name;
  String? author;
  String? info;
  int? scores;

  Description({this.name, this.author, this.info, this.scores});

  Description.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    info = json['info'];
    scores = json['scores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['author'] = this.author;
    data['info'] = this.info;
    data['scores'] = this.scores;
    return data;
  }
}

class Book {
  List<Part> parts; //Это массив
  Book({required this.parts});

  factory Book.fromJson(Map<String, dynamic> json) {
    var partsJson = json['book'] as List;

    //Необходимо пройтись по всем офисам и распасить каждый из них
    //map принимает каждый передаваемый элемент данных и применяет к нему некоторую функцию, после чего возвращает результат
    List<Part> partsList = partsJson
        .map((i) => Part.fromJson(i))
        .toList(); //Данные Json преобразовываются в наши собственные объекты

    Book(parts: json['offices']);
    return Book(
      parts: partsList,
    );
  }
}

class Part {
  String? text;
  Buttons? buttons;

  Part({this.text, this.buttons});

  Part.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    buttons =
        json['buttons'] != null ? new Buttons.fromJson(json['buttons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.buttons != null) {
      data['buttons'] = this.buttons!.toJson();
    }
    return data;
  }
}

class Buttons {
  OneButton? button1;
  OneButton? button2;

  Buttons({this.button1, this.button2});

  Buttons.fromJson(Map<String, dynamic> json) {
    button1 = json['button1'] != null
        ? new OneButton.fromJson(json['button1'])
        : null;
    button2 = json['button2'] != null
        ? new OneButton.fromJson(json['button2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.button1 != null) {
      data['button1'] = this.button1!.toJson();
    }
    if (this.button2 != null) {
      data['button2'] = this.button2!.toJson();
    }
    return data;
  }
}

class OneButton {
  String? name;
  String? goto;
  String? end;

  OneButton({this.name, this.goto, this.end});

  OneButton.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    goto = json['goto'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['goto'] = this.goto;
    data['end'] = this.end;
    return data;
  }
}

/*
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
*/
