import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/model/student_model.dart';

class studentDb extends ChangeNotifier {
  final studentList = [];

  void addStudent(Students value) async {
    final stdDb = await Hive.openBox<Students>('student');

    stdDb.add(value);
    studentList.add(value);
    getData();
    notifyListeners();
  }

  void getData() async {
    final stdDb = await Hive.openBox<Students>('student');
    studentList.clear();
    studentList.addAll(stdDb.values);
    notifyListeners();
  }

  void deleteData(int index) async {
    final stdDb = await Hive.openBox<Students>('student');
    stdDb.deleteAt(index);
    notifyListeners();
    getData();
  }

  void editData(Students value, int index) async {
    final stdDb = await Hive.openBox<Students>('student');
    stdDb.putAt(index, value);
    notifyListeners();
    getData();
  }

}
