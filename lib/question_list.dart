import 'package:flutter/material.dart';
import 'package:test3/question.dart'; // Importez le modèle de Question

class QuestionList extends StatelessWidget {
  final List<Question> questions; // Liste des questions
  final Function(Question) onDelete; // Fonction de suppression d'une question

  const QuestionList({Key? key, required this.questions, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          Question question = questions[index];
          return ListTile(
            title: Text(question.questionText),
            subtitle: Text('Correct Answer: ${question.correctAnswer}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                onDelete(question); // Appeler la fonction onDelete lorsqu'on appuie sur le bouton de suppression
              },
            ),
          );
        },
      ),
    );
  }
}
