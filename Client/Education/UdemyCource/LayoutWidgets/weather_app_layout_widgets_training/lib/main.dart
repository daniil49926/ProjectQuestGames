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
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: const IconThemeData(color: Colors.black54),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.yellow),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperature_forecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    alignment: Alignment.bottomCenter,
    image: NetworkImage(
        'https://data.kaktus.media/image/big/2021-04-22_11-40-36_182313.jpg'),
    //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLm_JRK11VaPyyUVZHL8eRr11SiRiWYdW05AXQ3nZEyBcIElueDXv9zT2raB5oI7BiarU&usqp=CAU'),
    fit: BoxFit.fill,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'переменная облачность. Без осадков. Ветер ночью северо-восточный 7-12 м/с, днем северо-западный 5-10 м/с. Температура воздуха ночью 16…18°, днем 25…27°.',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.amber,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '15° Clear',
            style: TextStyle(color: Colors.deepPurple),
          ),
          Text(
            'Murmanskaya oblast, Murmansk',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}

Wrap _temperature_forecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(
      8,
      (int index) {
        return Chip(
          label: Text(
            '${index + 20}°C',
            style: TextStyle(fontSize: 15.0),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      },
    ),
  );
}

Row _footerRatings() {
  var stars = Row(
    children: [
      Icon( Icons.star, size: 15, color: Colors.yellow[600],),
      Icon( Icons.star, size: 15, color: Colors.yellow[600],),
      Icon( Icons.star, size: 15, color: Colors.yellow[600],),
      Icon( Icons.star, size: 15, color: Colors.black,),
      Icon( Icons.star, size: 15, color: Colors.black,),

    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'info with openweathermap.org',
        style: TextStyle(fontSize: 15),
      ),
      stars,
    ],
  );
}
