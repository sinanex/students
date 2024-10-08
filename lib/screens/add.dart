import 'package:flutter/material.dart';
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
 
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                    'assets/images/avatar-student-character-your-project-others-avatar-student-character-277369390.jpg.webp'),
              ),
              radius: 75,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'age', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'class', border: OutlineInputBorder())),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'address', border: OutlineInputBorder())),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[900],
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: Text("submit")))
          ],
        ),
      ),
    );
  }
  

}
