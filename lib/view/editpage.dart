
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/controller/student_funtions.dart';
import 'package:students/model/student_model.dart';

// ignore: must_be_immutable
class Editpage extends StatefulWidget {
  String? name;
  String? age;
  String? cls;
  String? address;
  int? index;
  
  Editpage({
    super.key,
    required this.name,
    required this.age,
    required this.cls,
    required this.address,
    required this.index,
  });

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController nameEditController = TextEditingController();
  TextEditingController ageEditContoller = TextEditingController();
  TextEditingController classEditContoller = TextEditingController();
  TextEditingController adrressEditController = TextEditingController();
  // File? _selectedImage1;

  @override
  void initState() {
    super.initState();
    nameEditController = TextEditingController(text: widget.name);
    ageEditContoller = TextEditingController(text: widget.age);
    classEditContoller = TextEditingController(text: widget.cls);
    adrressEditController = TextEditingController(text: widget.address);
    // _selectedImage1 = File(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // CircleAvatar(
            //   radius: 75,
            //   backgroundImage: 
            //       FileImage(_selectedImage1!)
                
            // ),
            const SizedBox(height: 20),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.yellow[900],
            //     foregroundColor: Colors.white,
            //   ),
            //   // onPressed: image,
            //   child: Text("Change Avatar"),
            // ),
            const SizedBox(height: 20),
            TextField(
              controller: nameEditController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageEditContoller,
              decoration: InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: classEditContoller,
              decoration: InputDecoration(
                hintText: 'Class',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: adrressEditController,
              decoration: InputDecoration(
                hintText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[900],
                  foregroundColor: Colors.white,
                ),
                onPressed: onEditBtn,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onEditBtn() {
    final ename = nameEditController.text.trim();
    final eage = ageEditContoller.text.trim();
    final eclass = classEditContoller.text.trim();
    final eadress = adrressEditController.text.trim();
    // final image1 = _selectedImage1?.path ?? "";

    if (ename.isEmpty || eage.isEmpty || eclass.isEmpty || eadress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: const Color.fromARGB(255, 52, 52, 52),
        content: Text(
          "Please fill all fields",
          style: TextStyle(color: Colors.white),
        ),
      ));
    } else {
      final updateStudent = Students(
        image: eclass,
        studentName: ename,
        studentClass: eclass,
        studentAddress: eadress,
        age: eage,
      );
         Provider.of<studentDb>(context,listen: false).editData(updateStudent, widget.index!);
      Navigator.pop(context);
    }
  }

  // void image() async {
  //   final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _selectedImage1 = File(pickedImage.path);
  //     });
  //   }
  // }
}
