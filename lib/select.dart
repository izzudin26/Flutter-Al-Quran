import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  @override
  SelectState createState() => SelectState();
}

class SelectState extends State<Select> {
  List<String> items = ["Indonesia", "English"];
  String _selectLanguage = "Indonesia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logo(),
          dropDownLanguage(),
          Text(_selectLanguage == "Indonesia"
              ? "Kamu memilih Bahasa Indonesia"
              : "You Choose English Language"),
          nextButton()
        ],
      ),
    ));
  }

  Widget logo() {
    return Image.asset(
      "assets/logo.png",
      width: MediaQuery.of(context).size.width * 0.65,
    );
  }

  Widget dropDownLanguage() {
    return DropdownButton(
        hint: Text(_selectLanguage == "Indonesia"
            ? "Pilih Bahasa Terjemah"
            : "Choose Translate Language"),
        onChanged: (value) {
          setState(() {
            _selectLanguage = value;
          });
        },
        items: items.map((e) {
          return DropdownMenuItem(child: Text(e), value: e);
        }).toList());
  }

  Widget nextButton() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: RaisedButton(
          onPressed: () {},
          child: Text(
            _selectLanguage == "Indonesia" ? "Lanjutkan" : "Next",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          elevation: 1,
        ),
      ),
    );
  }
}
