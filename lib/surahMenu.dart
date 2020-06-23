import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:al_quran/surahView.dart';

class Surah {
  String name;
  String number;
  String idTranslate;
  String enTranslate;

  Surah({this.name, this.number, this.idTranslate, this.enTranslate});
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
        name: json["name"],
        number: json["number"].toString(),
        idTranslate: json["idNameTranslation"],
        enTranslate: json["englishNameTranslation"]);
  }
}

class SurahMenu extends StatefulWidget {
  String language;

  SurahMenu({Key key, this.language}) : super(key: key);

  @override
  _SurahMenuState createState() => _SurahMenuState();
}

class _SurahMenuState extends State<SurahMenu> {
  Future<List<Surah>> getData() async {
    final dataSurah = await rootBundle.loadString("data/surah.json");
    final jsonSurah = jsonDecode(dataSurah);
    print(jsonSurah);
    return (jsonSurah as List).map((surah) => Surah.fromJson(surah)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      child: showSurah(),
    ));
  }

  Widget showSurah() {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, idx) {
                  if (snapshot.hasData)
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SurahView(
                                          surahNumber:
                                              snapshot.data[idx].number,
                                          language: widget.language,
                                        )));
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[idx].number,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[idx].name,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        widget.language == "Indonesia"
                                            ? snapshot.data[idx].idTranslate
                                            : snapshot.data[idx].enTranslate,
                                        style: TextStyle(color: Colors.blue),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
