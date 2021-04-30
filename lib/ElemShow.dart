import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElemShow extends StatelessWidget {
  List<List<int>> _matr = null;
  List<String> _strs = null;

  ElemShow(List<List<int>> matrix, {List<String> strs}) {
    _matr = matrix;
    _strs = strs;
  }

  @override
  Widget build(BuildContext context) {
    List<Row> rows = [];
    for (int i = 0; i < _matr.length; i++) {
      List<Text> list = [];
      for (int j = 0; j < _matr[i].length; j++) {
        list.add(new Text(_matr[i][j].toString()));
      }
      rows.add(new Row(
        children: list,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ));
    }

    if (_strs != null) {
      for (int i = 0; i < _strs.length; i++) {
        rows.add(new Row(
          children: [Text(_strs[i])],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
      }
    }

    return Column(
      children: rows,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
