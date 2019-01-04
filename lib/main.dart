import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Heroes',
    theme: ThemeData(primarySwatch: Colors.green),
    home: HomePage(),
  ));
}
