import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/contoller/student_funtions.dart';
import 'package:students/model/student_model.dart';
import 'package:students/view/home.dart';
import 'package:students/view/login.dart';
import 'package:students/view/register.dart';
import 'package:students/view/splash.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentsAdapter());
  runApp(ChangeNotifierProvider(create:(context) => studentDb(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}