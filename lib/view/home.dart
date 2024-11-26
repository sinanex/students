import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/contoller/student_funtions.dart';
import 'package:students/view/add.dart';
import 'package:students/view/editpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<studentDb>(listen: false,context).getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddDetails()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<studentDb>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.studentList.length,
            itemBuilder: (context, index) {
              final data = value.studentList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Editpage(
                              name: data.studentName!,
                              age: data.age!,
                              cls: data.studentClass!,
                              address: data.studentAddress!,
                              index: index)));
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<studentDb>(context, listen: false)
                            .deleteData(index);
                      },
                    ),
                  ],
                ),
                title: Text(data.studentName!),
              );
            },
          );
        },
      ),
    );
  }
}
