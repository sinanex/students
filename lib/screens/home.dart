import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/model/student_model.dart';
import 'package:students/screens/add.dart';
import 'package:students/screens/details.dart';
import 'package:students/screens/editpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllStudent();

    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              suffix: Icon(Icons.search,
              size: 18,),
              hintText: '  search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: IconButton(
                  onPressed: () {
                    logout(context);
                  
                  },
                  icon: Icon(Icons.logout)),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[900],
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDetails()));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: studentListNotifier,
                builder: (context, List<Students> studentList, child) {
                  return studentList.isEmpty
                      ? Center(
                          child: Text(
                          "No data Available",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            final data = studentList[index];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentsDetails(
                                              name: data.studentName,
                                              age: data.age,
                                              cls: data.studentClass,
                                              address: data.studentAddress,
                                              imagePath: data.imagePath,
                                            )));
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Editpage(
                                                      name: data.studentName,
                                                      age: data.age,
                                                      cls: data.studentClass,
                                                      address: data.studentAddress,
                                                      index: index,
                                                      imagePath: data.imagePath,
                                                    )));
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        deleteBtn(index, context);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundImage: data.imagePath != null
                            ? FileImage(File(data.imagePath ?? "N/A"))
                            : const AssetImage("assets/student.jpg") 
                              ),
                              title: Text(
                                data.studentName,
                                style: TextStyle(color: Colors.amber),
                              ),
                            );
                          },
                          itemCount: studentList.length,
                        );
                },
              ),
            ),
          ],
        ));
  }


  void deleteBtn(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Conform Delete?", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        deleteStudent(index);
                        Navigator.of(context).pop();
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void logout( BuildContext context) async{
       SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('log', false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Conform Logout?", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, '/log');
                      },
                      child: Text("Logout"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
