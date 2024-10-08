import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/model/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,20,0),
            child: IconButton(onPressed: (){
              logout();
              Navigator.pushReplacementNamed(context, '/log');
            }, icon: Icon(Icons.logout)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[900],
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },child: Icon(Icons.add),),
        body: Expanded(child: ListView.separated(itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.image)),
            trailing:  Row(
     mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(Icons.edit,
        color: Colors.yellow[800],),
        onPressed: () {
         
        },
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.delete,
    color: Colors.yellow[800],))]),
      title: Text("student $index",
            
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          );
        }, separatorBuilder: (context,index){
          return Divider(
            thickness: 1,
          );
        }, itemCount: 3),
    ));
  }
  
  Future<void> logout() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('log', false);
  }
}
