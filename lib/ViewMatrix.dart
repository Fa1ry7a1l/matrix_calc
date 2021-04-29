import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrix_calc/ElemShow.dart';

class Show extends StatelessWidget {
  List<List<List<int>>> _matrList;
  List<List<String>> _stringList;
  List<Widget> _list = [];

  Show(List<List<List<int>>> matrList, List<List<String>> stringList) {
    this._matrList = matrList;
    this._stringList = stringList;
    _list = ShowList(_matrList, _stringList);
    print(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Решение"),
      ),
      body: Center(
        child: ListView(
          children: _list,
        ),
      ),
    );
  }

  List<Widget> ShowList(
      List<List<List<int>>> matrList, List<List<String>> strList) {
    List<Widget> list = [];
    //if (matrList.length - strList.length < 3) throw new Exception("Пидоры");

    for (int i = 0; i < strList.length; i++) {
      list.add(new ElemShow(_matrList[i], strs: _stringList[i]));
    }
    for (int i = strList.length; i < matrList.length; i++) {
      list.add(new ElemShow(_matrList[i]));
    }

    return list;
  }
}
