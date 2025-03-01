import 'package:ai_solution/constant/colors.dart';

import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, required this.message, required this.function});

  final String message;
    final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          Center(
            child: TextButton(
              onPressed: function,
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kFourthColor)),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: kSuccessColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kFourthColor),
            ),
          ],
        ));
  }
}