import 'package:flutter/material.dart';
import 'dart:async';

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
  Timer? timer;
  int timeLeft = 10; // le temps de lmite pour les questions

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
        'Viviane chidid',
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
          'https://th.bing.com/th/id/OIP.HQveIncDGlblyaRiu-TfkwHaEK?rs=1&pid=ImgDetMain',
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
      'imageUrl': 'https://i.ytimg.com/vi/RNYJvvJ2CWs/maxresdefault.jpg',
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
          'Qui a succédé à Macky Sall en tant que président du Sénégal?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.r8Ga_-uIfwwqOLk3DWbssQAAAA?rs=1&pid=ImgDetMain',
      'answers': [
        'Macky Sall',
        'Bassirou Diomaye Faye',
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
          'https://th.bing.com/th/id/R.40f088b374a8a24360ff2b1d8882b339?rik=Ctp%2bpUb%2fj745zA&riu=http%3a%2f%2frootsmagazine.fr%2fwp-content%2fuploads%2f2020%2f03%2fado.jpg&ehk=m%2bKsZx%2bndVanENJCy5IoINz%2f9aBk3eF7uiUnUOmZ6Wo%3d&risl=&pid=ImgRaw&r=0',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.694713990c3c835cafbd23f43a41a92d?rik=lI6tI0be6aR9Qg&pid=ImgRaw&r=0',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.fa2c9e25770dd5352d3d7b45222acbfa?rik=rbEr8K14e0SI6Q&riu=http%3a%2f%2fsport24.lefigaro.fr%2fvar%2fplain_site%2fstorage%2fimages%2ffootball%2fcoupe-du-monde%2factualites%2fune-coupe-du-monde-a-40-equipes-la-fifa-y-reflechit-781851%2f19541423-1-fre-FR%2fUne-Coupe-du-monde-a-40-equipes-La-Fifa-y-reflechit.jpg&ehk=SFWp1iBpb%2bivB0Ntuc33VbM%2bjS4%2bzvr%2bm4nLavE2PAQ%3d&risl=&pid=ImgRaw&r=0',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.U21GUgtIGNh9AzTOxmRAcQHaEw?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.69251c1bdae041f8e7e9ce8377f850bc?rik=tXDTgkcetxUW%2bA&pid=ImgRaw&r=0&sres=1&sresct=1',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.zAockPWApgN2CW9w7ji8iwHaEx?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.6ZbnWNt9WnVKWvTQ2HzTXQAAAA?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.iMFX7ekkNbvicMiR1cDRcAHaE8?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.4217738ff123a47e999daf1881e6967e?rik=Fd6JJb89saYklg&pid=ImgRaw&r=0',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.S3eiWZhMobPsMqifP5WxZAHaFm?rs=1&pid=ImgDetMain',
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
          'https://th.bing.com/th/id/OIP.ycv4E7a5zX66viFC4YxLgwAAAA?rs=1&pid=ImgDetMain',
      'answers': [
        'Thiéboudiène',
        'Yassa',
        'Mafé',
      ],
      'correctAnswer': 'Thiéboudiène',
    },

    {
      'category': 'Cuisine',
      'questionText':
          'Quelle est la principale différence entre le Yassa et le Mafé ?',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.99TthJzlPz7Oq8AbChcPRgHaFp?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.xy3W5jX-xFElo-9b096jtwHaHa?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://th.bing.com/th/id/OIP.A4vH9UEeDaexbb8JY725jgHaE6?rs=1&pid=ImgDetMain',
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
      'imageUrl':
          'https://www.leriz.fr/wp-content/uploads/2018/01/Le-riz-raffinage2.jpg',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.cfd706454b46f8a367bcb7081c80a30d?rik=IFXeNc1AONWt6Q&riu=http%3a%2f%2fmedicinalherbals.net%2fwp-content%2fuploads%2f2018%2f01%2fBaobab-Fruit.jpg&ehk=RTkZYrrYIYpeD62ZrCBey7Q0eqzL2pp4%2fOZQMIBXrDs%3d&risl=&pid=ImgRaw&r=0',
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
      'imageUrl':
          'https://cdn.tasteatlas.com/images/dishes/b30130535a804b278b55bad5539c2604.jpg?mw=1300',
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
      'imageUrl':
          'https://th.bing.com/th/id/R.5ca5aca1bed880a83a8deac6d88b24de?rik=xm0zQehfD3Z8Nw&riu=http%3a%2f%2fsenecuisine.com%2fwp-content%2fuploads%2f2011%2f05%2fDomoda-viande.jpg&ehk=fRGp6lAuGVdlvvsoFawyd%2fRsjZPace7iWteE5CMn77M%3d&risl=&pid=ImgRaw&r=0',
      'answers': [
        'Sauce viande',
        'Mafé',
        'Domada',
      ],
      'correctAnswer': 'Domada',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quel plat sénégalais est fait avec du riz, du poulet mariné au citron et aux oignons ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.73da7202c1d0a60b43f285bdd3eeea40?rik=XWfcy0qccxqGXA&riu=http%3a%2f%2fsenecuisine.com%2fwp-content%2fuploads%2f2018%2f08%2fRecette-de-Yassa-au-poulet.jpg&ehk=Db%2fUla2UJx8Zuixt3jVxCF1AslToDeYAAvsXhZiZ%2bOE%3d&risl=&pid=ImgRaw&r=0',
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
          'Le "Thiébou Yapp" est un plat sénégalais à base de quoi ?',
      'imageUrl':
          'https://th.bing.com/th/id/R.8b6a56d63f0fa5d1d5f77c896ffb361a?rik=ZvbtJtpvfOsGgg&pid=ImgRaw&r=0',
      'answers': [
        'Riz et poisson',
        'Riz et poulet',
        'Riz et viande',
      ],
      'correctAnswer': 'Riz et mouton',
    },
    {
      'category': 'Cuisine',
      'questionText':
          'Quelle est la boisson traditionnelle sénégalaise faite de fleurs hibiscus ?',
      'imageUrl':
          'https://th.bing.com/th?id=OIP.nKfCsZKKFfSW8s6W1g92AgHaJ4&w=200&h=200&c=9&rs=1&qlt=99&o=6&dpr=1.3&pid=13.1',
      'answers': [
        'Ataya',
        'Bissap',
        'Kinkeliba',
      ],
      'correctAnswer': 'Bissap',
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
    if (filteredQuestions.isNotEmpty) {
      startTimer();
    }
  }

  void startTimer() {
    timeLeft = 10; // Reset the time for the next question
    timer?.cancel(); // Cancel any previous timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        timer.cancel();
        moveToNextQuestion();
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  void moveToNextQuestion() {
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
    } else {
      startTimer();
    }
  }

  void _answerQuestion(String answer) {
    setState(() {
      isAnswered = true;
      selectedAnswer = answer;
      if (filteredQuestions[questionIndex]['correctAnswer'] == answer) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      moveToNextQuestion();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          ('Quiz - $category'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: questionIndex < filteredQuestions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.network(
                      filteredQuestions[questionIndex]['imageUrl'] as String,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    filteredQuestions[questionIndex]['questionText'] as String,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Time left: $timeLeft seconds',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List<Widget>.from(
                    (filteredQuestions[questionIndex]['answers']
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
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(answer),
                        ),
                      );
                    }),
                  ),
                  if (isAnswered)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        filteredQuestions[questionIndex]['correctAnswer'] ==
                                selectedAnswer
                            ? 'Bonne réponse!'
                            : 'Mauvaise réponse! La bonne réponse était : ${filteredQuestions[questionIndex]['correctAnswer']}',
                        style: TextStyle(
                          fontSize: 12,
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
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
