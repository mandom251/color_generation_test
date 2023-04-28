import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Test For Solid Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My way to Solid Software'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 late Color containerColor ;
  final Random _random = Random();
  Color  colorGenerator() {
    return Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
  }
  @override
  void initState() {
    super.initState();
    //to set the initial color
    containerColor = colorGenerator();
  }

  // this function is here so that we can see the text no mather what the background color is
  Color foregroundColorGenerator(Color color) {
    if (ThemeData.estimateBrightnessForColor(color) == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }
  void colorChanger() {
    setState(() {
      containerColor = colorGenerator();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: foregroundColorGenerator(containerColor),
        backgroundColor: containerColor,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: containerColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              TextButton(onPressed: (){
                colorChanger();
              }, child: Text(
                'Hello There',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: foregroundColorGenerator(containerColor)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
