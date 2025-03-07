// ignore_for_file: file_names

import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/pages/admin_login_page.dart';
import 'package:ai_solution/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2fa/flutter_2fa.dart';
import 'package:gap/gap.dart';

class TwoFaActivation extends StatefulWidget {
  const TwoFaActivation({super.key});

  @override
  State<TwoFaActivation> createState() => _TwoFaActivationState();
}

class _TwoFaActivationState extends State<TwoFaActivation> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.35),
              child: formfield("Email", "Email", 1, _emailController, null,
                  null, Validator.email),
            ),
            const Gap(80),
            ElevatedButton(
                onPressed: () => Flutter2FA().activate(
                    context: context,
                    appName: "AI - Solution",
                    email: _emailController.text),
                child: Text("Activate 2 Fa"))
          ],
        ),
      ),
    );
  }

  Widget formfield(
      String hintText,
      String label,
      int? maxLines,
      TextEditingController controller,
      IconButton? suffixIcon,
      bool? isObsecure,
      Validator? validator) {
    return TextFormField(
        style: TextStyle(fontSize: 12),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        obscureText: isObsecure ?? false,
        controller: controller,
        validator: validator != null
            ? () {
                switch (validator) {
                  case Validator.email:
                    return (value) => TextFieldValidator.email(value);

                  case Validator.phone:
                    return (value) => TextFieldValidator.phone(value, context);
                }
              }()
            : null,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          labelText: label,
          labelStyle: const TextStyle(color: kFourthColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kFourthColor),
          ),

          //borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kFourthColor, width: 1),
          ),
          // borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kFourthColor),
          ),
        ));
  }
}
