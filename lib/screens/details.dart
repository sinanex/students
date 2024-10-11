import 'dart:io';

import 'package:flutter/material.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/widgets/widget.dart';

// ignore: must_be_immutable
class StudentsDetails extends StatelessWidget {
  String? name;
  String? age;
  String? cls;
  String? address;
  dynamic imagePath;
  StudentsDetails(
      {super.key,
      required this.name,
      required this.age,
      required this.cls,
      required this.address,
      required this.imagePath,
      });
  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,

                 backgroundImage: imagePath!=null?  FileImage(File(imagePath!)):AssetImage('assets/images/std.webp'),

              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [styledText("name : "), styledText("$name")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [styledText("Age : "), styledText("$age")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [styledText("class : "), styledText("$cls")],
              ),
           
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [styledText("address : "), styledText("$address")],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800],
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
