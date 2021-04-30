import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterMatrix.dart';

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

    for (int i = 0; i < _matr.length; i++) {}
    return Column(
      children: [],
    );
  }
}
