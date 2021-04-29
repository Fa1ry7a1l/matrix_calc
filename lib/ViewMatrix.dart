import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterMatrix.dart';

class Show extends StatelessWidget {
  List<List<List<int>>> _matrList;
  List<List<String>> _stringList;

  Show(List<List<List<int>>> matrList, List<List<String>> stringList) {
    this._matrList = matrList;
    this._stringList = stringList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Решение"),
      ),
      body: Center(
        child: 
          ListView(
          padding: const EdgeInsets.all(8),
          children: ShowList(_matrList),
           
        ),
        ),
      );
    );
  }


  List<Widget> ShowList(List<List<List<int>>> matrList)
  {
    ListView mylist =  ListView.builder(
      itemBuilder: (BuildContext ctxt, int index){
        return new Text(matrList.first.first.first.toString());
      }
    
      );
      //return mylist;

  }


  




}
