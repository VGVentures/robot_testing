import 'package:flutter/material.dart';
import 'package:robot_testing/counter_page.dart';
import 'package:robot_testing/login_page.dart';
import 'package:robot_testing/scrolling_list_page.dart';

void main() {
  runApp(RobotTestingApp());
}

class RobotTestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Robot Testing Example')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Counter'),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(CounterPage.route()),
              ),
              ListTile(
                title: Text('Login'),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(LoginPage.route()),
              ),
              ListTile(
                title: Text('Scrolling list'),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    Navigator.of(context).push(ScrollingListPage.route()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
