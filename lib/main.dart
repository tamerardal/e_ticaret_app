import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:flutter/material.dart';

import 'db/db_Helper.dart';
import 'models/Urun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Urun> products = new List<Urun>();
    dbHelper dbhelper = new dbHelper();
    dbhelper.createdb().then((database) => {});

    Urun prod1 = new Urun("Android TV", "OLED 52''", 7000);
    dbhelper.add(prod1);
    Urun prod2 = new Urun("MacBook", "Pro", 16000);
    dbhelper.add(prod2);
    Urun prod3 = new Urun("IPhone 12", "Max", 12000);
    dbhelper.add(prod3);
    Urun prod4 = new Urun("Swatch", "Colorful", 1000);
    dbhelper.add(prod4);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
