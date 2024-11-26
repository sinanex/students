import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/screens/add.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDetails()));
      },child: Icon(Icons.add),),
      body: Consumer<studentDb>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.studentList.length,
          itemBuilder: (context, index) {
            final data = value.studentList[index];
          return ListTile(
            title: Text(data.studentName!),
          );
        },);
      },),
    );
  }
}