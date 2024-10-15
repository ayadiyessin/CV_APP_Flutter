import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_textfield.dart';

class RegisterPage_1 extends StatelessWidget {
  RegisterPage_1({super.key});

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final telController = TextEditingController();
  final emailController = TextEditingController();
  final pswController = TextEditingController();
  final confpswController = TextEditingController();

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
              Icons.one_k,
              size: 50,
              color: Color.fromARGB(255, 10, 49, 118),
            ),

            const SizedBox(height: 20),

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
                      'Information Personelle',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 29, 29, 29),
                        fontSize: 18
                      ),
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

            const SizedBox(height: 25),
            MyTextField(
              controller: nomController,
              hintText: 'Nom',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: prenomController,
              hintText: 'Prenom',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: telController,
              hintText: 'Téléphone',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: emailController,
              hintText: 'email',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: pswController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: confpswController,
              hintText: 'Confirmer Password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/register_2');
                },
                child: Center(
                  child: Text(
                    'next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color.fromARGB(255, 10, 49, 118), // Set button background color
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'J\'ai déja un compte ?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector( // Wrap "Register now" with GestureDetector
                    onTap: () {
                      Navigator.pushNamed(context, '/login'); // Navigate to register page
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
