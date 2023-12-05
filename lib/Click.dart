import 'dart:convert';
import 'package:animater/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model.dart';

class Click extends StatefulWidget {
  Model model =Model(name: '', position: '', image: '', velocity: '', distance: '', description: '');
  Click({Key, key,});

  @override
  State<Click> createState() => _ClickState();
}
List<Model> modelList = [];

class _ClickState extends State<Click> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String dataString =
            await rootBundle.loadString('Assets/planet.json');
            List jsonData = jsonDecode(dataString);
            modelList = Model.parseList(jsonData);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MainScreen()));
          },
          child: Text('Click'),
        ),
      ),
    );
  }
}