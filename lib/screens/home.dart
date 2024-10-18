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
  String search = '';
  List<Students> searchedList = [];
  void searchListUpdate() {
    getAllStudent();
    searchedList = studentListNotifier.value
        .where((stdModel) =>
            stdModel.studentName.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                search = value;
                searchListUpdate();
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Search',
              labelStyle: const TextStyle(color: Colors.white),
              focusColor: Colors.white,
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddDetails()));
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
              builder:
                  (BuildContext, List<Students> studentList, Widget? child) {
                return search.isNotEmpty
                    ? searchedList.isEmpty
                        ? const Center(
                            child: Text(
                              'No results found.',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : _buildStudentList(searchedList)
                    : _buildStudentList(studentList);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentList(List<Students> students) {
    return students.isEmpty
        ? const Center(
            child: Text(
              'No students available.',
              style: TextStyle(color: Colors.white),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              final data = students[index];
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
                    // ignore: unnecessary_null_comparison
                    backgroundImage: data.imagePath != null
                        ? FileImage(File(data.imagePath!))
                        : AssetImage('assets/images/std.webp')

                    // backgroundImage: FileImage(File(data.imagePath!))
                    ),
                title: Text(
                  data.studentName,
                  style: TextStyle(color: Colors.amber),
                ),
              );
            },
            itemCount: students.length,
          );
  }
  //       ),
  //     ),
  //   ],
  // ));
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

void logout(BuildContext context) async {
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
