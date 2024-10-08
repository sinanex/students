import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   bool? isLogged =false;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), checkLogin);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white
        ),),
      ),
    );
  }
  
  Future <void> checkLogin()async {
       SharedPreferences pref =await SharedPreferences.getInstance();
       isLogged = pref.getBool('log');

      if(isLogged==true){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
           Navigator.pushReplacementNamed(context, '/log');
      }
  }
}