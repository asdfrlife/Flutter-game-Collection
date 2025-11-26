import 'package:flutter/material.dart';
import 'package:games/homePage.dart';
import 'package:games/theGames/RockpaperScissor.dart';
 // import the new homepage file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/rockPaper': (context) => const RockPaperPage(),
      },
      // set the home to the new HomePage
    );
  }
}
