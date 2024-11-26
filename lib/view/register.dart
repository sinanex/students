import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final TextEditingController _nameContoller = TextEditingController();
  final TextEditingController _userContoller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Register",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: _nameContoller,
              decoration: const InputDecoration(
                  hintText: 'name', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _userContoller,
              decoration: const InputDecoration(
                  hintText: 'username', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(
                  hintText: 'password', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("already have an account? "),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/log'),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[900]),
                    onPressed: () {
                      register();
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Future<void> register()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id = _userContoller.text;
    String? pass = _passController.text;
    pref.setBool('log', true);
    if (id.isNotEmpty && pass.isNotEmpty) {
await  pref.setString('id', id);
await  pref.setString('pass', pass);
Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          duration: Duration(seconds: 2),
    backgroundColor: Color.fromARGB(255, 54, 54, 54),
    content: Text(
      "Incorrect Username or Password",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
         ));
    }
  }
}
