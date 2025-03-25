import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget(
      {super.key, required this.message, required this.function});

  final String message;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        content: Material(

          color: Colors.white,
          elevation: 8,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                const Gap(15),
                const Divider(),
                const Gap(15),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kFourthColor),
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => context.navigateBack(),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              kMessageBubbleColor)),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: kFourthColor),
                      ),
                    ),
                    const Gap(25),
                    TextButton(
                      onPressed: function,
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.red)),
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
