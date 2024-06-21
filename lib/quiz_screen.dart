import 'package:flutter/material.dart';

// QuizScreen class
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

// QuizScreenState class
class QuizScreenState extends State<QuizScreen> {
  late String category;
  int questionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String selectedAnswer = '';

  final List<Map<String, Object>> questions = [
    {
      'category': 'Musique',
      'questionText': 'Quel est le plus grand festival de musique au Sénégal ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.129bef361deed00f636a4cbd744d8234?rik=R5jv01v%2bCPXSyA&pid=ImgRaw&r=0',
      'answers': [
        'Dakar Music Festival',
        'Saint-Louis Jazz',
        'Festival de Thies',
        'Kaay Fecc'
      ],
      'correctAnswer': 'Saint-Louis Jazz',
    },
    {
      'category': 'Histoire',
      'questionText':
          'En quelle année le Sénégal a-t-il obtenu son indépendance?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.j9f5HRbaqewUWUFlRo8nxAHaE8?rs=1&pid=ImgDetMain',
      'answers': ['1960', '1958', '1962', '1963'],
      'correctAnswer': '1960',
    },
    {
      'category': 'Capitale',
      'questionText': 'Quelle est la capitale du Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.JWsm1NHDC1wzoSE166kEewHaE7?rs=1&pid=ImgDetMain',
      'answers': ['Dakar', 'Saint-Louis', 'Thiès', 'Kaolack'],
      'correctAnswer': 'Dakar',
    },
    {
      'category': 'Cuisine',
      'questionText': 'Quel est le plat national du Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.XF1WCvDPkg3oFg2Ap069wwHaIz?rs=1&pid=ImgDetMain',
      'answers': ['Thiéboudiène', 'Yassa', 'Mafé', 'Thiakry'],
      'correctAnswer': 'Thiéboudiène',
    },
    // Ajoutez plus de questions ici pour chaque catégorie
  ];

  late List<Map<String, Object>> filteredQuestions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as String;
    filteredQuestions =
        questions.where((q) => q['category'] == category).toList();
  }

  void _answerQuestion(String answer) {
    setState(() {
      isAnswered = true;
      selectedAnswer = answer;
      if (filteredQuestions[questionIndex]['correctAnswer'] == answer) {
        score++;
      }
    });

    Future.delayed(Duration(seconds: 8), () {
      setState(() {
        questionIndex++;
        isAnswered = false;
        selectedAnswer = '';
      });

      if (questionIndex >= filteredQuestions.length) {
        Navigator.pushNamed(
          context,
          '/result',
          arguments: score,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          ('Quiz - $category'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: questionIndex < filteredQuestions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    filteredQuestions[questionIndex]['imageUrl'] as String,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    filteredQuestions[questionIndex]['questionText'] as String,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ...(filteredQuestions[questionIndex]['answers']
                          as List<String>)
                      .map((answer) {
                    Color buttonColor = Colors.blue;
                    if (isAnswered) {
                      if (answer ==
                          filteredQuestions[questionIndex]['correctAnswer']) {
                        buttonColor = Colors.green;
                      } else if (answer == selectedAnswer) {
                        buttonColor = Colors.red;
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed:
                            isAnswered ? null : () => _answerQuestion(answer),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(answer),
                      ),
                    );
                  }).toList(),
                  if (isAnswered)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        filteredQuestions[questionIndex]['correctAnswer'] ==
                                selectedAnswer
                            ? 'Bonne réponse!'
                            : 'Mauvaise réponse! La bonne réponse était : ${filteredQuestions[questionIndex]['correctAnswer']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: filteredQuestions[questionIndex]
                                      ['correctAnswer'] ==
                                  selectedAnswer
                              ? Colors.green
                              : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
