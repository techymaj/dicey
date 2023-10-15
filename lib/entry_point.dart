import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int face = 2;
int? previous;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // void rollDice() {}

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
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "dice-images/dice-$face.png",
                  width: 120,
                ),
                const BodyText(text: "Chance is the only game i play with"),
                const BodyText(text: "We let our battles choose us"),
                const SizedBox(
                  height: 30,
                ),
                Builder(
                  builder: (context) => TextButton(
                    onPressed: () {
                      // roll dice
                      setState(() {
                        Random random = Random();
                        previous = face;
                        face = random.nextInt(6) + 1;
                      });
                      // SnacKbar code
                      // SnackBarMessenger.of(context)
                      final snackBar = SnackBar(
                        content: Text('$face'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              face = previous!;
                            });
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.amber.shade300,
                        backgroundColor:
                            const Color.fromARGB(78, 255, 224, 130),
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                        )),
                    child: const Text('Roll dice'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
