import 'package:flutter/material.dart';
import 'screens/home.dart'; //MyHomePage를 읽기 위해 써줘야함

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, primaryColor: Colors.white),
        home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}
