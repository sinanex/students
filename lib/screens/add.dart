import 'dart:developer';
import 'dart:io';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/model/student_model.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
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
               backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
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

                onPressed: (){
                fromGallery();
              }, child: Text("Add Avatar")),
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
                        onAddBtn();
                      },
                      child: const Text("submit"))),
        ]),
          ),
        ));
  }

  Future<void> onAddBtn() async {
    final name = nameController.text;
    final age = ageContoller.text;
    final address = adrressController.text;
    final cls = classContoller.text;


    if (name.isEmpty || age.isEmpty || address.isEmpty || cls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          content: Text(
            "please fill all feild",
            style: TextStyle(color: Colors.white),
          )));
    } else {
      final student = Students(
        imagePath: _selectedImage?.path ?? " " ,
        studentName: name,
        age: age,
        studentAddress: address,
        studentClass: cls,
      );

      addStudent(student);
      log(student.studentName);
      Navigator.pop(context);
    }
  }

  void fromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    
      setState(() {
        _selectedImage = File(image!.path); 
      });
    }
}

 