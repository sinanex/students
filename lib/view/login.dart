import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _userLog = TextEditingController();
    final TextEditingController _passLog = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
            SizedBox(
              height: 60,
            ),
       TextField(
              controller: _userLog,
              decoration: const InputDecoration(
                hintText: 'username',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20,),
           TextField(
           obscureText: true,
            controller: _passLog,
              decoration:  InputDecoration(
                
                hintText: 'password',
                border: OutlineInputBorder(),
               
               
              ),
            ),
            SizedBox(height: 10,),
            const Align(
              alignment: Alignment.topRight,
              child: Text("forgot password?")),
              const SizedBox(
                height: 30,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account "),
           GestureDetector(
            onTap: () => Navigator.pushNamed(context,'/reg'),
            child: const Text("signUp",
            style: TextStyle(
              color: Colors.yellow
            ),),
           ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
                  SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[900]
                ),
                onPressed: (){
                CheckLog();
                }, child: const Text("LogIn",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)))
          ],
        ),
      ),
    );
  }
  
  Future<void> CheckLog() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var storedId = pref.getString('id');
    var storedPass = pref.getString('pass');
    var logId = _userLog.text;
    var logPass = _passLog.text;

    if(storedId==logId && storedPass==logPass){
      Navigator.pushReplacementNamed(context, '/home');
          pref.setBool('log', true);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        
  const SnackBar(
     duration: Duration(seconds: 2),
    backgroundColor: Color.fromARGB(255, 54, 54, 54),
    content: Text(
      "Incorrect Username or Password",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

      print("login error");
    }
  }
}