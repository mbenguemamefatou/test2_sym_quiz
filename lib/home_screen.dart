import 'package:flutter/material.dart';
import 'database_helper.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final dbHelper = DatabaseHelper();
  late String _playerName;

  @override
  void initState() {
    super.initState();
    _playerName = widget.userName;
    loadUserName();
  }

  Future<void> loadUserName() async {
    final users = await dbHelper.getUsers();
    if (users.isNotEmpty) {
      String playerName = users.last['name'];
      setState(() {
        _playerName = playerName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text(
          'Jeu De Culture Sénégalaise',
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
              'Bienvenue, $_playerName!',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Découvrez la Culture Sénégalaise!',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  Image.network(
                    'https://th.bing.com/th/id/OIP.TeCuHPXgCpC2PKSlrCT0SQHaHa?rs=1&pid=ImgDetMain',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 15.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              icon: const Icon(Icons.play_arrow, size: 30.0),
              label: const Text(
                'Commencer',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}