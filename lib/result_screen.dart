import 'package:flutter/material.dart';
import 'package:test3/admin_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments de la route en toute sécurité
    final int? score = ModalRoute.of(context)?.settings.arguments as int?;

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text(
          'Résultats',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Votre score : ${score ?? 'N/A'}', // Afficher 'N/A' si score est null
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/categories', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Rejouer'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AdminScreen()),
            //     );
            //   },
            //   child: Text('Accéder à l\'interface administrateur'),
            // ),
          ],
        ),
      ),
    );
  }
}
