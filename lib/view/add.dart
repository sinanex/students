import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/controller/image.dart';
import 'package:students/controller/student_funtions.dart';
import 'package:students/model/student_model.dart';
import 'package:students/view/home.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController ageContoller = TextEditingController();

  TextEditingController classContoller = TextEditingController();

  TextEditingController adrressController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: Provider.of<imageProvider>(context,listen: false).image != null
                    ? FileImage(Provider.of<imageProvider>(context,listen: false).image!)
                    : const AssetImage('assets/images/std.webp'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow[900],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Provider.of<imageProvider>(context,listen: false).getImage();
                  },
                  child: Text("Add Avatar")),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageContoller,
                decoration: const InputDecoration(
                    hintText: 'age', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: classContoller,
                  decoration: const InputDecoration(
                      hintText: 'class', border: OutlineInputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: adrressController,
                  decoration: const InputDecoration(
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
                        onAddBtn(context);
                      },
                      child: const Text("submit"))),
            ]),
          ),
        ));
  }

  Future<void> onAddBtn(BuildContext context) async {
    final name = nameController.text;
    final age = ageContoller.text;
    final address = adrressController.text;
    final cls = classContoller.text;

    if (name.isEmpty && age.isEmpty && address.isEmpty && cls.isEmpty) {
      return;
    } else {
      final data = Students(
        image: Provider.of<imageProvider>(context,listen: false).image!.path,
          studentName: name,
          studentClass: cls,
          studentAddress: address,
          age: age);
       Provider.of<studentDb>(context,listen: false).addStudent(data);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
