import 'package:flutter/material.dart';

import 'roll_dice.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Dicey'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: const [.3, .4, .3],
              colors: [
                Colors.blueGrey.shade900,
                Colors.black,
                Colors.blueGrey.shade900,
              ],
            ),
          ),
          child: const Center(
            child: RollDice(),
          ),
        ),
      ),
    );
  }
}
