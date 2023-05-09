import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'credit.dart';
import 'dart:math';

void main() {
  runApp(GaPiTApp());
}

class GaPiTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GaPiTApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String box1Title = _generateRandomWord();
  String box2Title = _generateRandomWord();
  String box3Title = _generateRandomWord();
  String bigWidgetText =
      "Click any button below and you will be able to get a random GPT generated fact related to that word!";
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GaPiTApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  bigWidgetText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.courierPrime(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(box1Title, (newTitle) => box1Title = newTitle),
                _buildBox(box2Title, (newTitle) => box2Title = newTitle),
                _buildBox(box3Title, (newTitle) => box3Title = newTitle),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.credit_card),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreditPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title, Function(String) setTitle) {
    return GestureDetector(
      child: Box(title: title),
      onTap: () {
        setState(() {
          bigWidgetText = title;
          setTitle(_generateRandomWord());
        });
      },
    );
  }

  static String _generateRandomWord() {
    final _random = Random();
    List<String> words = ['apple', 'banana', 'cherry', 'orange', 'pear'];
    return words[_random.nextInt(words.length)];
  }
}

class Box extends StatelessWidget {
  final String title;

  Box({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
