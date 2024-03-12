import 'package:flutter/material.dart';
import 'package:flutter_application_1/Db/model/datamodel.dart';

ValueNotifier<List<studentmodel>> studentlistnotifier = ValueNotifier([]);

void twostudent(studentmodel value) {
  studentlistnotifier.value.add(value);
  studentlistnotifier.notifyListeners();
}
