import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/functions/student_funtions.dart';
import 'package:students/model/student_model.dart';
import 'package:students/screens/add.dart';
import 'package:students/screens/home.dart';
import 'package:students/screens/login.dart';
import 'package:students/screens/register.dart';
import 'package:students/screens/splash.dart';

void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(StudentsAdapter());
 var box = await Hive.openBox<Students>('studentBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/home':(context)=>const HomeScreen(),
        '/splash':(context)=>const SplashScreen(),
        '/reg':(context)=>const registerPage(),
        '/log':(context)=>const Loginpage(),
        '/add':(context)=>const AddDetails()

      },
      initialRoute: '/splash',
    );
  }
}