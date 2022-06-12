import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(
        title: 'Makria'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String imageLink = 'assets/off_button.png';
  int status = 0; //0 = off, 1 = on, 2 = on and alert
  final player = AudioCache();

  void _onButtonPressed(String value) {
    setState(() {
      imageLink = value;
    });
  }

  void _onAlert() async {
    player.play('kid_air_raid.mp3');
    _onButtonPressed('assets/alert_button.png');
    status = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset(imageLink),
              iconSize: 500,
              onPressed: () {
                if (status == 0){
                  _onButtonPressed('assets/on_button.png');
                  status = 1;
                }
                else if(status == 1){
                  _onButtonPressed('assets/off_button.png');
                  status = 0;
                }
                else{
                  _onButtonPressed('assets/on_button.png');
                  status = 1;
                  player.clearAll();
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                if(status == 1){
                  _onAlert();
                  Future.delayed(const Duration(seconds: 13), (){
                    _onButtonPressed('assets/on_button.png');
                    status = 1;
                  });
                }
                else null;
              },
            ),
          ],
        ),
      ),
    );
  }

}
