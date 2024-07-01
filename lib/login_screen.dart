import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final dbHelper = DatabaseHelper();

  Future<void> saveUserName() async {
    String userName = nameController.text.trim();
    if (userName.isNotEmpty) {
      // Perform the database operation
      await dbHelper.insertUser(userName);

      // After the async operation, check if the widget is still mounted
      if (!mounted) return;

      // Use the BuildContext after ensuring the widget is still mounted
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)),
      );
    } else {
      // Show the snackbar without async operation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Le nom ne peut pas être vide')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Entrer votre nom'),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUserName,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
