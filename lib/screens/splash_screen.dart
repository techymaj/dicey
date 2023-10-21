import 'package:first_app/entry_point.dart';
import 'package:flutter/material.dart';
import './typography/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: colorPrimary,
              ),
              const SizedBox(
                height: 60.0,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MyApp(),
                    ),
                  );
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: colorPrimary,
                      width: .2,
                    ),
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow,
                  color: colorPrimary,
                ),
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: colorPrimary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
