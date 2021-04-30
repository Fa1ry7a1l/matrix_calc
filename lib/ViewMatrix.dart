import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrix_calc/ElemShow.dart';

class Show extends StatelessWidget {
  List<List<List<int>>> _matrList;
  List<List<String>> _stringList;
  List<Widget> _list = [];
  int l = 0;

  Show(List<List<List<int>>> matrList, List<List<String>> stringList, int l) {
    this._matrList = matrList;
    this._stringList = stringList;
    this.l = l;
    _list = ShowList(_matrList, _stringList, l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Решение"),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: _list,
          ),
        ));
  }

  List<Widget> ShowList(
      List<List<List<int>>> matrList, List<List<String>> strList, int l) {
    List<Widget> list = [];
    //if (matrList.length - strList.length < 3) throw new Exception("Пидоры");
    for (int i = 0; i < strList.length; i++) {
      list.add(new ElemShow(matrList[i], l, strs: strList[i]));
    }
    for (int i = strList.length; i < matrList.length; i++) {
      list.add(new ElemShow(matrList[i], l));
    }
    return list;
  }
}
