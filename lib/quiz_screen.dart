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
      'category': 'Musique',
      'questionText': 'Qui est souvent surnommé le roi du Mbalax au Sénégal ?',
      'imageUrl':
          'https://images.radio-canada.ca/v1/ici-premiere/16x9/mbalax-chronique-musique-afrique.jpg',
      'answers': [
        'Ismael lô',
        'Youssou Ndour',
        'Viviane Chidid',
      ],
      'correctAnswer': 'Youssou Ndour',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quelle chanteuse sénégalaise est célèbre pour sa chanson "Pata Pata" ?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.KsvRonA6a60XjF1WCcF6CAHaHa?rs=1&pid=ImgDetMain',
      'answers': [
        'Coumba Gawlo',
        'Viviane chisid',
        'Dior Mbaye',
      ],
      'correctAnswer': 'Coumba Gawlo',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quel instrument de musique traditionnel est largement utilisé dans la musique sénégalaise ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.dc6c381b94c731bd40809ed3fc8351f4?rik=j26FKGb6XFPiOA&pid=ImgRaw&r=0',
      'answers': [
        'Kora',
        'Balafon',
        'Tama',
      ],
      'correctAnswer': 'Tama',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quelle danse est souvent associée au genre musical Mbalax ?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.erhuwaCJVeMvxiZOwjapgQHaEL?rs=1&pid=ImgDetMain',
      'answers': [
        'Sabar',
        'Salsa',
        'Tango',
      ],
      'correctAnswer': 'Sabar',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quel artiste sénégalais est souvent surnommé le "Golden Boy" ?',
      'imageUrl':
          'https://senegal7.com/wp-content/uploads/2023/01/Wally-Seck.jpg',
      'answers': [
        'Pape Diouf',
        'Wally Seck',
        'Abba',
      ],
      'correctAnswer': 'Wally Seck',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quelle chanteuse sénégalaise est connue pour son single "Marie & Cheikh" en 2020 ?',
      'imageUrl': 'https://i.ytimg.com/vi/It7B-VIfeT8/hqdefault.jpg',
      'answers': [
        'Samba Peuzzi',
        'Dip Doundou Guiss',
        'Amadess',
      ],
      'correctAnswer': 'Samba Peuzzi',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quel artiste sénégalais a popularisé le genre musical "Trap-Sénégal" ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.8df565b5018d80fd33c334056996a965?rik=a5GIbqnNIE%2bHPw&pid=ImgRaw&r=0',
      'answers': [
        'Akhlou Brick',
        'Dip Doundou Guiss',
        'Ngaaka Blinde',
      ],
      'correctAnswer': 'Dip Doundou Guiss',
    },

    {
      'category': 'Musique',
      'questionText':
          'Dans quelle chanson adiouza entend-on : "Ma la nob, ma la nob, Sama yaye boy" ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.e30401ab1dbc4041e93e14190c1908cd?rik=gY99j%2b7xajLxZg&pid=ImgRaw&r=0',
      'answers': [
        'Li Ma Done',
        'Sama Xarit',
        'Ma La Nob',
      ],
      'correctAnswer': 'Ma La Nob',
    },

    {
      'category': 'Musique',
      'questionText':
          'Quelle chanson a été composée par Narah Diouf et Jeeba ?',
      'imageUrl': 'https://i.ytimg.com/vi/FgfzJJH3l3A/maxresdefault.jpg',
      'answers': [
        'Yow Rek',
        'Xarit',
        'Gauche walla',
      ],
      'correctAnswer': 'Yow Rek',
    },

    {
      'category': 'Histoire',
      'questionText':
          'En quelle année le Sénégal a-t-il obtenu son indépendance?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.j9f5HRbaqewUWUFlRo8nxAHaE8?rs=1&pid=ImgDetMain',
      'answers': [
        '1960',
        '1958',
        '1962',
      ],
      'correctAnswer': '1960',
    },
    {
      'category': 'Histoire',
      'questionText':
          'Quelle était la capitale coloniale du Sénégal avant Dakar?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.j9f5HRbaqewUWUFlRo8nxAHaE8?rs=1&pid=ImgDetMain',
      'answers': [
        'Thiès',
        'Saint Louis',
        'Ziguinchor',
      ],
      'correctAnswer': 'Saint Louis',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quel événement marquant a eu lieu le 23 juin 2011 au Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.0KnExnTfJ-_t0yUigjervQAAAA?rs=1&pid=ImgDetMain',
      'answers': [
        ' Indépendance du Sénégal',
        'Manifestations contre les réformes constitutionnelles',
        'Première élection multipartite',
      ],
      'correctAnswer': 'Manifestations contre les réformes constitutionnelles',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Qui a succédé à Léopold Sédar Senghor en tant que président du Sénégal?',
      'imageUrl':
          'https://www.leral.net/photo/art/grande/9587025-15410754.jpg?v=1464688096',
      'answers': [
        'Macky Sall',
        'Abdou Diouf',
        'Abdoulaye Wade',
      ],
      'correctAnswer': 'Abdou Diouf',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quel leader religieux a fondé la confrérie des Mourides au Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/R.50122406ed61979165b3bed61aa5ba3e?rik=O9lSF%2bxH%2f6YVPQ&riu=http%3a%2f%2fwww.dakar-echo.com%2fwp-content%2fuploads%2f2023%2f03%2fbamba-770x470.jpeg&ehk=lVj%2bfX%2bQaXmJ%2fIxLqzWllnKi7MQPWDPR4YqWLUdzo3o%3d&risl=&pid=ImgRaw&r=0',
      'answers': [
        'El hadj Malick Sy',
        'Cheikh Ahmadou Bamba',
        'Cheikh Ibrahim Niass',
      ],
      'correctAnswer': 'Cheikh Ahmadou Bamba',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quel est le nom de la fête musulmane célébrée à Médina Baye, Kaolack, pour commémorer la naissance du prophète Muhammad?',
      'imageUrl':
          'https://th.bing.com/th/id/R.974a56844bf388c721d3af262a92847a?rik=bg3pcuzq%2beYQBA&pid=ImgRaw&r=0',
      'answers': [
        'Magal',
        'Korité',
        'Gamou',
      ],
      'correctAnswer': 'Gamou',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quel roi du royaume du Sine est célèbre pour sa résistance contre les forces coloniales françaises ?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.gQ8kH6lx47hECQjK-kRoswHaEc?rs=1&pid=ImgDetMain',
      'answers': [
        'Lat Dior Diop',
        ' Maad a Sinig Kumba Ndoffène Famak Joof',
        ' Almamy Samory Touré',
      ],
      'correctAnswer': 'Maad a Sinig Kumba Ndoffène Famak Joof',
    },
    {
      'category': 'Histoire',
      'questionText':
          'Qui était le fondateur de Empire du Djolof, un des premiers royaumes sénégalais ?',
      'imageUrl':
          'https://www.afrik.com/wp-content/uploads/2024/01/ndiadiane-ndiaye-696x392.jpg',
      'answers': [
        'Lat Dior Diop',
        'Ndiadiane Ndiaye',
        ' Maba Diakhou Bâ',
      ],
      'correctAnswer': 'Ndiadiane Ndiaye',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quelle était la principale ressource exportée par le Sénégal au cours de la période coloniale ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.207393a605ade7d86da0187bc3c5685f?rik=qFLQfMm9NNOjuQ&pid=ImgRaw&r=0&sres=1&sresct=1',
      'answers': [
        'Le pétrole',
        'arachide',
        'Le coton',
      ],
      'correctAnswer': 'arachide',
    },

    {
      'category': 'Histoire',
      'questionText':
          'Quel grand penseur sénégalais a écrit "Nations Nègres et Culture" et a profondément influencé la pensée africaine ?',
      'imageUrl':
          'https://i0.wp.com/laviesenegalaise.com/wp-content/uploads/2020/02/Cheikh-Anta-Diop.jpg?fit=750%2C979&ssl=1',
      'answers': [
        'Léopold Sédar Senghor',
        'Cheikh Anta Diop',
        ' Amadou Hampâté Bâ',
      ],
      'correctAnswer': 'Cheikh Anta Diop',
    },

    {
      'category': 'Sport',
      'questionText':
          'Quel joueur sénégalais a remporté la Ligue des champions de UEFA avec Liverpool en 2019"?',
      'imageUrl': '',
      'answers': [
        'Sadio Mané',
        'Kalidou Koulibaly',
        'Cheikhou Kouyaté',
      ],
      'correctAnswer': 'Sadio Mané',
    },
    {
      'category': 'Sport',
      'questionText':
          'En quelle année le Sénégal a-t-il participé pour la première fois à la Coupe du monde de la FIFA ?',
      'imageUrl': '',
      'answers': [
        '2010',
        '2002',
        '1998',
      ],
      'correctAnswer': '2002',
    },
    {
      'category': 'Sport',
      'questionText':
          'Qui a marqué le but en or contre la Suède lors de la Coupe du monde 2002 ?',
      'imageUrl': '',
      'answers': [
        'El Hadji Diouf',
        'Salif Diao',
        'Henri Camara',
      ],
      'correctAnswer': 'Henri Camara',
    },
    {
      'category': 'Sport',
      'questionText':
          'Quel est le surnom de équipe nationale de football du Sénégal ?',
      'imageUrl': '',
      'answers': [
        'Les Éléphants',
        'Les Lions de la Téranga',
        'Les Aigles',
      ],
      'correctAnswer': 'Les Lions de la Téranga',
    },
    {
      'category': 'Sport',
      'questionText':
          'Qui a été le premier entraîneur sénégalais à qualifier le Sénégal pour la Coupe du monde ?',
      'imageUrl': '',
      'answers': [
        'Bruno Metsu',
        'Aliou Cissé',
        'Abdoulaye Sarr',
      ],
      'correctAnswer': 'Bruno Metsu',
    },
    {
      'category': 'Sport',
      'questionText':
          'En quelle année le Sénégal a-t-il remporté la Coupe Afrique des Nations (CAN) pour la première fois ?',
      'imageUrl': '',
      'answers': [
        '2002',
        '2019',
        '2022',
      ],
      'correctAnswer': '2022',
    },
    {
      'category': 'Sport',
      'questionText':
          ' Quel joueur sénégalais a marqué le premier but de la Coupe du monde 2002 contre la France ?',
      'imageUrl': '',
      'answers': [
        'Pape Bouba Diop',
        'El Hadji Diouf',
        'Khalilou Fadiga',
      ],
      'correctAnswer': 'Pape Bouba Diop',
    },
    {
      'category': 'Sport',
      'questionText':
          ' Quel joueur sénégalais a marqué le premier but de la Coupe du monde 2002 contre la France ?',
      'imageUrl': '',
      'answers': [
        'Pape Bouba Diop',
        'El Hadji Diouf',
        'Khalilou Fadiga',
      ],
      'correctAnswer': 'Pape Bouba Diop',
    },
    {
      'category': 'Sport',
      'questionText':
          ' Quel club sénégalais a remporté le championnat national le plus de fois ?',
      'imageUrl': '',
      'answers': [
        'Casa Sports',
        'Génération Foot',
        'ASC jaaraf',
      ],
      'correctAnswer': 'ASC jaaraf',
    },
    {
      'category': 'Sport',
      'questionText':
          'Quel joueur sénégalais a joué pour Chelsea et Everton en Premier League anglaise ? ',
      'imageUrl': '',
      'answers': [
        'Papiss Cissé',
        'Demba Ba',
        'Idrissa Gueye',
      ],
      'correctAnswer': 'Demba Ba',
    },

    {
      'category': 'Cuisine',
      'questionText': 'Quel est le plat national du Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.XF1WCvDPkg3oFg2Ap069wwHaIz?rs=1&pid=ImgDetMain',
      'answers': ['Thiéboudiène', 'Yassa', 'Mafé', 'Thiakry'],
      'correctAnswer': 'Thiéboudiène',
    },

    {
      'category': 'Cuisine',
      'questionText':
          'Quelle est la principale différence entre le Yassa et le Mafé ?',
      'imageUrl': '',
      'answers': [
        'Le Yassa utilise du citron, le Mafé utilise de arachide',
        'Le Yassa est végétarien, le Mafé est à base de viande',
        'Le Yassa est un dessert, le Mafé est un plat principal',
      ],
      'correctAnswer':
          'Le Yassa utilise du citron, le Mafé utilise de arachide',
    },

    {
      'category': 'Cuisine',
      'questionText':
          'Quel dessert sénégalais est fait à base de couscous sucré ?',
      'imageUrl': '',
      'answers': [
        'Sombi',
        'Thiakry',
        'Banana Bread',
      ],
      'correctAnswer': 'Thiakry',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel type de poisson est le plus souvent utilisé dans le Thiéboudiène ?',
      'imageUrl': '',
      'answers': [
        'Saumon',
        'Tilapia',
        'Thiof',
      ],
      'correctAnswer': 'Thiof',
    },
    {
      'category': 'Cuisine',
      'questionText':
          ' Quelle est la principale base de la cuisine sénégalaise ?',
      'imageUrl': '',
      'answers': [
        'Riz',
        'Pâtes',
        'Pommes de terre',
      ],
      'correctAnswer': 'Riz',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel fruit est souvent utilisé pour préparer la boisson "Bouye" ?',
      'imageUrl': '',
      'answers': [
        'Fruit du baobab',
        'Mangue',
        'Goyave',
      ],
      'correctAnswer': 'Fruit du baobab',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel dessert sénégalais est fait à base de riz au lait de coco ?',
      'imageUrl': '',
      'answers': [
        'Banana Cake',
        'Sombi',
        'Thiakry',
      ],
      'correctAnswer': 'Sombi',
    },
    {
      'category': 'Cuisine',
      'questionText': 'Quel plat sénégalais les homme aiment pas',
      'imageUrl': '',
      'answers': [
        'Sauce viande',
        'Mafé',
        'Domadar',
      ],
      'correctAnswer': 'Domadar',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel plat sénégalais est fait avec du riz, du poulet mariné au citron et aux oignons ?',
      'imageUrl': '',
      'answers': [
        'Yassa Poulet',
        'Thiou',
        'Mafé Poulet',
      ],
      'correctAnswer': 'Yassa Poulet',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel ingrédient principal est utilisé dans le Thiéboudiène ?',
      'imageUrl': '',
      'answers': [
        'Pâtes',
        'Riz',
        'Maïs',
      ],
      'correctAnswer': 'Riz',
    },
    {
      'category': 'Cuisine',
      'questionText': 'Quel est le plat national du Sénégal ?',
      'imageUrl': '',
      'answers': [
        'Thiéboudiène',
        'Domadar',
        'Mafé',
      ],
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

    Future.delayed(Duration(seconds: 2), () {
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
