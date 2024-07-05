import 'package:flutter/material.dart';
import 'package:test3/question.dart'; // Importez le modèle de Question

class QuestionForm extends StatefulWidget {
  final Question? initialQuestion;
  final Function(Question) onSubmit;
  final List<String> categories; // Liste des catégories disponibles

  const QuestionForm({
    Key? key,
    this.initialQuestion,
    required this.onSubmit,
    required this.categories,
  }) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String _correctAnswer = '';
  String _imageUrl = '';
  String _selectedCategory = '';
  
  get _answerController => null; // Catégorie sélectionnée

  @override
  void initState() {
    super.initState();
    if (widget.initialQuestion != null) {
      _questionController.text = widget.initialQuestion!.questionText;
      _optionControllers[0].text = widget.initialQuestion!.options[0];
      _optionControllers[1].text = widget.initialQuestion!.options[1];
      _optionControllers[2].text = widget.initialQuestion!.options[2];
      _optionControllers[3].text = widget.initialQuestion!.options[3];
      _correctAnswer = widget.initialQuestion!.correctAnswer;
      _imageUrl = widget.initialQuestion!.imageUrl;
      _selectedCategory = widget.initialQuestion!.category; // Charger la catégorie initiale si elle existe
    } else {
      _selectedCategory = widget.categories.first; // Définir la première catégorie par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialQuestion == null ? 'Ajouter une Question' : 'Modifier la Question'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ...List.generate(
              4,
              (index) => TextFormField(
                controller: _optionControllers[index],
                decoration: InputDecoration(labelText: 'Option ${index + 1}'),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              items: widget.categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Catégorie'),
            ),
            SizedBox(height: 20),
        
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Réponse Correcte',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: _imageUrl,
              onChanged: (value) {
                setState(() {
                  _imageUrl = value;
                });
              },
              decoration: InputDecoration(labelText: 'URL de l\'image (optionnel)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            // Créer une nouvelle question
            Question newQuestion = Question(
              id: widget.initialQuestion?.id ?? UniqueKey().toString(),
              questionText: _questionController.text,
              options: [
                _optionControllers[0].text,
                _optionControllers[1].text,
                _optionControllers[2].text,
                _optionControllers[3].text,
              ],
              correctAnswer: _correctAnswer,
              imageUrl: _imageUrl,
              category: _selectedCategory, // Associer la catégorie sélectionnée à la question
            );

            // Soumettre la question
            widget.onSubmit(newQuestion);

            // Fermer le dialogue
            Navigator.pop(context);
          },
          child: Text(widget.initialQuestion == null ? 'Ajouter' : 'Modifier'),
        ),
      ],
    );
  }
}
