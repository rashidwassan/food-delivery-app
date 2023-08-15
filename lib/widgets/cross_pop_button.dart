import 'package:flutter/material.dart';
import 'package:sayfood/styles/styling.dart';

class CrossPopButton extends StatelessWidget {
  const CrossPopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        size: 30,
        color: Styling.darkGrey,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
