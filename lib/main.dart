import 'package:flutter/material.dart';

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

  void _onButtonPressed(String value){
    setState(() {
      imageLink = value;
    });
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
                else{
                  _onButtonPressed('assets/off_button.png');
                  status = 0;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}
