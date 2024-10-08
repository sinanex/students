import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:students/model/student_model.dart';

ValueNotifier<List<Students>>StudentsListNotifier = ValueNotifier([]);

void addStudents(Students value)async{
  // StudentsListNotifier.value.add(value);

final studentdb = await Hive.openBox<Students>('student_db');
await studentdb.add(value);
StudentsListNotifier.value.add(value);
  StudentsListNotifier.notifyListeners();
}

Future<void>getAllStudents()async{
  final studentdb = await Hive.openBox<Students>('student_db');
  StudentsListNotifier.value.addAll(studentdb.values);
}