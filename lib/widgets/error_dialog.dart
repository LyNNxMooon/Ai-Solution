import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.errorMessage, required this.function});

  final String errorMessage;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          Center(
            child: TextButton(
              onPressed: function,
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 226, 226))),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: kErrorColor,
            ),
            const Gap(10),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kErrorColor),
            ),
          ],
        ));
  }
}
