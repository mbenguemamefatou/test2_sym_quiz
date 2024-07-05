import 'package:flutter/material.dart';
import 'package:test3/question.dart';
import 'package:test3/question_form.dart';
import 'package:test3/question_list.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Question> _questions = []; // Liste des questions
  final List<String> categories = [
    'Histoire',
    'Géographie',
    'Cuisine',
    'Musique',
    // Ajoutez d'autres catégories selon vos besoins
  ];

  void _addQuestion(Question question) {
    setState(() {
      _questions.add(question);
    });
  }

  void _deleteQuestion(Question question) {
    setState(() {
      _questions.removeWhere((q) => q.id == question.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface Administrateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenue dans l\'interface administrateur!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => QuestionForm(
                    onSubmit: _addQuestion,
                    categories: categories, // Passer la liste des catégories à QuestionForm
                  ),
                );
              },
              child: Text('Ajouter une Question'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionList(
                      questions: _questions,
                      onDelete: _deleteQuestion,
                    ),
                  ),
                );
              },
              child: Text('Liste des Questions'),
            ),
          ],
        ),
      ),
    );
  }
}
