import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElemShow extends StatelessWidget {
  List<List<int>> _matr;
  List<String> _strs;
  int _l;

  ElemShow(List<List<int>> matrix, int l, {List<String> strs}) {
    _matr = matrix;
    _l = l;
    _strs = strs;
  }

  @override
  Widget build(BuildContext context) {
    List<Column> colL = [];
    List<Column> colR = [];
    for (int i = 0; i < _matr[0].length; i++) {
      List<Widget> listL = [];
      List<Widget> listR = [];
      for (int j = 0; j < _matr.length; j++) {
        if (i < _l) {
          listL.add(Container(
            child: Text(
              _matr[j][i].toString(),
              style: TextStyle(fontSize: 16),
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          ));
        } else {
          listR.add(Container(
            child: Text(
              _matr[j][i].toString(),
              style: TextStyle(fontSize: 16),
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          ));
        }
      }
      colL.add(new Column(
        children: listL,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ));
      colR.add(new Column(
        children: listR,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ));
    }
    List<Widget> rows = [];
    if (_matr[0].length > _l) {
      rows.add(new Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: colL,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: colR,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ))
          ],
        ),
      ));
    } else {
      rows.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: colL,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ))
        ],
      ));
    }

    if (_strs != null) {
      for (int i = 0; i < _strs.length; i++) {
        rows.add(new Row(
          children: [
            Text(
              _strs[i],
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
      }
    }

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.all(5),
        child: Column(
          children: rows,
        ),
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ));
  }
}
