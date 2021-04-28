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

  @override
  Widget build(BuildContext context) {
    List<Row> rows = [];

    for (int i = 0; i < _a; i++) {
      List<Container> texts = [];
      for (int j = 0; j < _b; j++) {
        texts.add(
          new Container(
            width: 25,
            child: new TextFormField(
              controller: _textEditingControllers[i][j],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),

          )
        );
      }
      rows.add(new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: texts,

      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rows,
    );
  }
}
