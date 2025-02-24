import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:flutter/material.dart'; //Handles the ticker operation for animation.


void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice_Roller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 60, 143, 121),
        brightness: Brightness.dark),
        textTheme: TextTheme(
          bodyLarge: const TextStyle(
            fontSize: 24, 
            color: Colors.white,
            ),
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 18, 95, 71),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  int _diceRoll = 1;
  int _diceSides = 6;
  final Random _random = Random();

  void _rollDice() {
    setState(() {
      _diceRoll = _random.nextInt(_diceSides) + 1;
    });
  }
  //Getter for finding how many sides to the dice from the user.
  void _setDiceSides(int sides) {
    setState(() {
      _diceSides = sides;
      _diceRoll = 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have rolled:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "$_diceRoll",
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text("Roll Dice"),
            ),
            SizedBox(height: 20),
            Text("Select Dice Type:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _setDiceSides(6),
                  child: Text("D6"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _setDiceSides(12),
                  child: Text("D12"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _setDiceSides(20),
                  child: Text("D20"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

