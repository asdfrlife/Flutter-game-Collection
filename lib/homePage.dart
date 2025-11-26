import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _isPressed = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 50,
        title: const Text(
          "Games",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Rock paper Scissor',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _isPressed = false;
              });
              Future <void>.delayed(const Duration(milliseconds: 10000));
              Navigator.pushNamed(context, '/rockPaper');
            },
            onTapCancel: () {
              setState(() {
                _isPressed = false;
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeOut,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 120),
              margin: EdgeInsets.only(left: 10, right: 10, top: _isPressed ? 5 : 0),
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/rockpap2.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: _isPressed
                    ? []
                    : const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(0, 6),
                  ),
                ],
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
