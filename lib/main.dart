import 'package:flutter/material.dart';
import 'package:al_quran/select.dart';
import 'surahMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Al-Qur'an",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Select());
  }
}
