import 'dart:convert';

import 'package:flutter/material.dart';

import 'config_parser.dart';

class QuestEnginePage extends StatelessWidget {
  //Map ourJson = jsonDecode(loadConfig() as String);
  //final data = ourJson['Scores']; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Long text.......',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18)),
                      ),
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
                          onTap: () {},
                          child: Ink(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/ButtonFon.png",
                                    height: 50),
                                Center(
                                  child: Text('Part 1',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
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
                          onTap: () {},
                          child: Ink(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/ButtonFon.png",
                                    height: 50),
                                Center(
                                  child: Text('Part 2',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
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
                          onTap: () {},
                          child: Ink(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/ButtonFon.png",
                                    height: 50),
                                Center(
                                  child: Text('Part 3',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
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
                          onTap: () {},
                          child: Ink(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                    fit: BoxFit.fitWidth,
                                    "images/ButtonFon.png",
                                    height: 50),
                                Center(
                                  child: Text('Part 4',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
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
    );
  }
}
