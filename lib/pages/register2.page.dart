import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_textfield.dart';

class RegisterPage_2 extends StatelessWidget {
  RegisterPage_2({super.key});

  final facebokController = TextEditingController();
  final githubController = TextEditingController();
  final linkedinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.two_k,
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
                      'Réseau Sociaux',
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
              controller: facebokController,
              hintText: 'URL Facebook',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: githubController,
              hintText: 'URL GitHub',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: linkedinController,
              hintText: 'URL LinkedIn',
              obscureText: false,
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
                  Navigator.pushNamed(context, '/register_3');
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
          ],
        ),
      )),
    );
  }
}
