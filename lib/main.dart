import 'package:flutter/material.dart';
import 'package:test3/home_screen.dart';
import 'package:test3/category_screen.dart';
import 'package:test3/quiz_screen.dart';
import 'package:test3/result_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'culture sénégalaise',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/categories': (context) => const CategoryScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/result': (context) => const ResultScreen(),
          
        });
  }
}
