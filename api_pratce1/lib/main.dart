import 'package:api_pratce1/api_disple/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "API handel",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}