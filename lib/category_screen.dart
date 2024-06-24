import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          'Séléctionnez une catégorie',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryButton(category: 'Musique', icon: Icons.music_note),
              SizedBox(height: 20),
              CategoryButton(category: 'Histoire', icon: Icons.history_edu),
              SizedBox(height: 20),
              CategoryButton(category: 'Sport', icon: Icons.sports_soccer),
              SizedBox(height: 20),
              CategoryButton(category: 'Cuisine', icon: Icons.restaurant_menu),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;
  final IconData icon;

  CategoryButton({required this.category, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        backgroundColor: Colors.teal, // background color
        foregroundColor: Colors.white, // text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(icon, size: 30),
      label: Text(category),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/quiz',
          arguments: category,
        );
      },
    );
  }
}
