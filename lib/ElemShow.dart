
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterMatrix.dart';

class ElemShow extends StatelessWidget {

  List<List<int>> _matr = null;
  List<String> _strs = null;
  ElemShow(List<List<int>> matrix, {List<String> strs})
  {
    _matr=matrix;
    _strs=strs;
  }

  @override
  Widget build(BuildContext context) {
    if (_strs==null){
      return Text("AAAAAA");
    }
    return Text("BBBBB");
  }
}
