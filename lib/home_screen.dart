import 'package:flutter/material.dart';
import 'database_helper.dart';

class HomeScreen extends StatefulWidget {
  final String initialUserName;
  

  HomeScreen(this.initialUserName);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbHelper = DatabaseHelper();
   late String _playerName;

  @override
  void initState() {
    super.initState();
    _playerName = widget.initialUserName;
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final users = await dbHelper.getUsers();
    if (users.isNotEmpty) {
      // Assuming 'name' is stored as 'name' in database
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
        title: Text(
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
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Découvrez la Culture Sénégalaise!',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  Image.network(
                    'https://th.bing.com/th/id/OIP.TeCuHPXgCpC2PKSlrCT0SQHaHa?rs=1&pid=ImgDetMain',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  icon: Icon(Icons.play_arrow, size: 30.0),
                  label: Text(
                    'Commencer',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final playerName = await Navigator.pushNamed(context, '/login');
                    if (playerName != null) {
                      setState(() {
                        _playerName = playerName as String;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Entrer votre nom',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
