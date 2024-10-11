import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/model/student_model.dart';

ValueNotifier<List<Students>>studentListNotifier=ValueNotifier([]);
Future<void>addStudent(Students value)async{
  final studentDb=await Hive.openBox<Students>('student_db');
  await studentDb.add(value);
   log(studentDb.name);
getAllStudent();
  
}
Future<void>getAllStudent()async{
final studentDb=await Hive.openBox<Students>('student_db');
studentListNotifier.value.clear();
studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();

}

Future<void> deleteStudent(int index) async {
  final studentDb = await Hive.openBox<Students>('student_db');
  await studentDb.deleteAt(index);
  getAllStudent();
}
Future<void> editing(index, Students value) async {
  final studentDb = await Hive.openBox<Students>('student_db');
  studentDb.putAt(index, value);
getAllStudent();
}
