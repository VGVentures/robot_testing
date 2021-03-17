import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => CounterPage());
  }

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(child: Text('$counter')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
