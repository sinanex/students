import 'dart:io';

import 'package:flutter/material.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/model/student_model.dart';

// ignore: must_be_immutable
class Editpage extends StatefulWidget {
  String? name;
  String? age;
  String? cls;
  String? address;
  int? index;
  dynamic imagePath;
  Editpage({
    super.key,
    required this.name,
    required this.age,
    required this.cls,
    required this.address,
    required this.index,
    required this.imagePath
  });

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController nameEditController = TextEditingController();
  TextEditingController ageEditContoller = TextEditingController();
  TextEditingController classEditContoller = TextEditingController();
  TextEditingController adrressEditController = TextEditingController();
File? _selectedImage1;
  @override
  Widget build(BuildContext context) {
    nameEditController = TextEditingController(text: widget.name);
    ageEditContoller = TextEditingController(text: widget.age);
    classEditContoller = TextEditingController(text: widget.cls);
    adrressEditController = TextEditingController(text: widget.address);
   _selectedImage1 = widget.imagePath != '' ? File(widget.imagePath) : null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,
                 backgroundImage: _selectedImage1!= null
                    ? FileImage(_selectedImage1!)
                    : const AssetImage('assets/student.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameEditController,
                decoration: InputDecoration(
                    hintText: 'name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageEditContoller,
                decoration: InputDecoration(
                    hintText: 'age', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: classEditContoller,
                  decoration: InputDecoration(
                      hintText: 'class', border: OutlineInputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: adrressEditController,
                  decoration: InputDecoration(
                      hintText: 'address', border: OutlineInputBorder())),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[900],
                          foregroundColor: Colors.white),
                      onPressed: () {
                        onEditBtn();
                      },
                      child: const Text("submit")))
            ],
          ),
        ),
      ),
    );
  }

  void onEditBtn() {
    final ename = nameEditController.text.trim();
    final eage = ageEditContoller.text.trim();
    final eclass = classEditContoller.text.trim();
    final eadress = adrressEditController.text.trim();
    final image1 = _selectedImage1?.path?? "";
    if (ename.isEmpty || eage.isEmpty || eclass.isEmpty || eadress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: const Color.fromARGB(255, 52, 52, 52),
          content: Text(
            "please fill all feild",
            style: TextStyle(color: Colors.white),
          )));
    } else {
      final updateStudent= Students(studentName: ename, studentClass: eclass, studentAddress: eadress, age: eage,imagePath: image1);
      editing(widget.index, updateStudent);
      Navigator.pop(context);
    }
  }
}
