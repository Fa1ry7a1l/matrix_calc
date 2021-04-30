import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterMatrix extends StatelessWidget {
  int _a = 0, _b = 0, _l = 0;
  List<List<TextEditingController>> _textEditingControllers = [];

  EnterMatrix(int a, int b, int l) {
    this._a = a;
    this._b = b;
    this._l = l;

    _textEditingControllers = [];

    for (int i = 0; i < a; i++) {
      List<TextEditingController> list = [];
      for (int j = 0; j < b; j++) {
        list.add(new TextEditingController());
      }
      _textEditingControllers.add(list);
    }
  }

  List<List<TextEditingController>> getControllers() {
    return _textEditingControllers;
  }

  @override
  Widget build(BuildContext context) {
    List<Row> rowsL = [];
    List<Row> rowsR = [];

    for (int i = 0; i < _a; i++) {
      List<Container> textsL = [];
      List<Container> textsR = [];
      for (int j = 0; j < _b; j++) {
        if (j < _l) {
          textsL.add(new Container(
            margin: EdgeInsets.all(5),
            width: 35,
            child: new TextFormField(
              controller: _textEditingControllers[i][j],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ));
        } else {
          textsR.add(new Container(
            width: 35,
            margin: EdgeInsets.all(5),
            child: new TextFormField(
              controller: _textEditingControllers[i][j],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ));
        }
      }

      rowsL.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: textsL,
      ));
      rowsR.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: textsR,
      ));
    }

    if (_l >= _b) {
      return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: rowsL,
          ),
          decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ));
    }
    List<Widget> res = [];
    res.add(
      new Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: rowsL,
          ),
          decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          )),
    );

    res.add(new Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: rowsR,
        ),
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        )));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: res);
  }
}
