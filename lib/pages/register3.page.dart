import 'package:flutter/material.dart';

class RegisterPage_3 extends StatelessWidget {
  RegisterPage_3({super.key});

  final descpController = TextEditingController();

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
              Icons.three_k,
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
                      'About you',
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
            
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: descpController,
              decoration: 
              InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Description ...',
                    hintStyle: TextStyle(color:Colors.grey[500]),
                  ),
              keyboardType: TextInputType.multiline,
              minLines: 1, // <-- SEE HERE
              maxLines: 5, // <-- SEE HERE
              ),
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
                  Navigator.pushNamed(context, '/login');
                },
                child: Center(
                  child: Text(
                    'Enregister',
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
