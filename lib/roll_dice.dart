import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'body_text_default.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

Random random = Random();
var face = random.nextInt(6) + 1;
int? previous;
var countDown = 0;

class _RollDiceState extends State<RollDice> {
  @override
  void initState() {
    super.initState();
    countDown = face;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$countDown',
          style: const TextStyle(
            fontSize: 128.0,
            color: Color.fromARGB(109, 255, 236, 179),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
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
              setState(
                () {
                  previous = face;
                  face = random.nextInt(6) + 1;
                  countDown = face;
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    if (countDown <= 1) {
                      timer.cancel();
                    }
                    setState(() {
                      countDown--;
                    });
                    // if snackbar action is pressed, cancel timer
                    if (previous == face) {
                      timer.cancel();
                      countDown = face;
                    }
                  });
                },
              );
              // SnacKbar code
              final snackBar = SnackBar(
                content: Text('$face'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    setState(() {
                      countDown = previous!;
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
                backgroundColor: const Color.fromARGB(78, 255, 224, 130),
                textStyle: const TextStyle(
                  fontSize: 20.0,
                )),
            child: const Text('Roll dice'),
          ),
        )
      ],
    );
  }
}
