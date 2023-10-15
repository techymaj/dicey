import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 28,
      ),
    );
  }
}
