import 'package:flutter/material.dart';
import 'package:quran/views/list-of-seur/list-of-sur.dart';
import 'package:quran/views/play-page/play-page.dart';
import 'package:quran/views/radio-list/radio-list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      home: RadioList()
    );
  }
}