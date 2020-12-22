import 'dart:collection';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  Queue<String> journey = new Queue<String>();

  void addTimeStamp(category) {
    setState(() {
      if (journey.length > 16) journey.removeLast();
      journey.addFirst(
          formatDate(DateTime.now(), [mm, '/', dd, ' ', hh, ':', mm, ':', ss]) +
              ' ( ' +
              category +
              ')');
    });
  }

  void showAlertDialog() {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        journey.clear();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Heads-up"),
      content: Text(
          "Are you sure you want to clear this?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            for (var item in journey)
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(item,
                      style: TextStyle(fontSize: 24, color: Colors.indigo)))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Food'),
            child: Icon(
              FontAwesomeIcons.bone,
              color: Colors.orangeAccent,
            ),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Water'),
            child: Icon(Icons.local_drink_outlined),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Pee'),
            child: Icon(
              Icons.waves,
              color: Colors.yellow,
            ),
          ),
          FloatingActionButton(
            onPressed: () async => addTimeStamp('Poop'),
            child: Icon(
              Icons.location_on,
              color: Colors.brown,
            ),
          ),
          FloatingActionButton(
            onPressed: showAlertDialog,
            child: Icon(
              FontAwesomeIcons.timesCircle,
              color: Colors.red,
            ),
            // child: Icon(Icons.clear, color: Colors.red,),
          )
        ],
      ),
    );
  }
}
