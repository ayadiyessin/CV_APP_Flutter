import 'package:flutter/material.dart';

import 'package:projet_cv/components/my_textfield.dart';
import 'package:projet_cv/components/square_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late SharedPreferences prefs;
  TextEditingController usernameController = new TextEditingController(); // hetha 3malt controle bech nejem ne5o value mte3 login
  TextEditingController passwordController = new TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'welcome back you\'ve been missed',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                onPressed: () {
                  _onConnecte(context);
                },
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black, // Set button background color
                ),
              ),
            ),


            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'lib/images/google.png'),
                SizedBox(width: 25),
                SquareTile(imagePath: 'lib/images/apple.png'),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member ?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector( // Wrap "Register now" with GestureDetector
                  onTap: () {
                    Navigator.pushNamed(context, '/register_1'); // Navigate to register page
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _onConnecte(BuildContext context) async{
    prefs = await SharedPreferences.getInstance(); // zedneha async ... await bech n9olo requete tebta chwaya estaneha w raja3li type de future
    if(!usernameController.text.isEmpty && !passwordController.text.isEmpty){
      prefs.setString("login", usernameController.text);
      prefs.setString("psw", passwordController.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }
    else {
      const snackBar = SnackBar(
        content: Text('remplir les champs')
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
