import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final dbHelper = DatabaseHelper();

  Future<void> _saveUserName() async {
    String userName = _nameController.text.trim();
    if (userName.isNotEmpty) {
      await dbHelper.insertUser(userName);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userName)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le nom ne peut pas être vide')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Entrer votre nom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserName,
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
