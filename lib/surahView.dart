import 'package:flutter/material.dart';

class SurahView extends StatefulWidget {
  String surahNumber;
  String language;

  SurahView({Key key, this.surahNumber, this.language}) : super(key: key);

  @override
  _SurahViewState createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.surahNumber} - ${widget.language}"),
      ),
    );
  }
}
