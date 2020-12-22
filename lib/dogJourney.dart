import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String category;
  String textToShow = "";

  void addTimeStamp(category) {
    setState(() {
      textToShow =
          formatDate(DateTime.now(), [mm, '/', dd, ' ', hh, ':', mm, ':', ss]) +
              ' ( ' +
              category +
              ')' +
              '\n' +
              textToShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Dog\'s Journey'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(textToShow, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Food'),
            child: Icon(Icons.fastfood),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Water'),
            child: Icon(Icons.local_drink),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Pee'),
            child: Icon(Icons.waves),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Poop'),
            child: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
