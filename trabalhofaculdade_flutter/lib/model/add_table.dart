import 'package:flutter/material.dart';

class TableModel {
  TextEditingController number;
  bool isReserved;

  TableModel({this.isReserved = false, String number = ''})
      : this.number = TextEditingController(text: number);
}
