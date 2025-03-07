import 'package:ai_solution/BLoC/admin_auth/admin_auth_bloc.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_events.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool? showPassword = true;

  late final adminAuthBloc = context.read<AdminAuthBloc>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const Gap(15),
                      Text(
                        "Admin Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const Gap(80),
                  formfield("Admin Email", "Admin Email", 1, _emailController,
                      null, null, Validator.email),
                  const Gap(20),
                  formfield(
                      "Password",
                      "Password",
                      1,
                      _passwordController,
                      IconButton(
                          onPressed: () {
                            showPassword = !showPassword!;
                            setState(() {});
                          },
                          icon: showPassword!
                              ? const Icon(
                                  Icons.visibility_outlined,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                )),
                      showPassword,
                      null),
                  const Gap(50),
                  BlocConsumer<AdminAuthBloc, AdminAuthStates>(
                    builder: (context, state) {
                      if (state is AdminAuthLoading) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      } else {
                        return ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    WidgetStatePropertyAll(Colors.white),
                                backgroundColor:
                                    WidgetStatePropertyAll(kFourthColor)),
                            onPressed: () => adminAuthBloc.add(AdminLogin(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context)),
                            child: Text("Login"));
                      }
                    },
                    listener: (context, state) {
                      if (state is UnAuthenticated) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: state.message,
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            const Gap(100),
            Text("Copyright 2025 - AI-Solution")
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

class TextFieldValidator {
  static String? phone(String? phone, BuildContext context) {
    String pattern = r'^(?:[+0]9)?[0-9]{9,12}$';

    RegExp regExp = RegExp(
      pattern,
    );
    if (phone!.isEmpty) {
      return 'Please enter Phone Number !';
    } else if (!regExp.hasMatch(phone)) {
      return "Please enter validate Phone Number !";
    }
    return null;
  }

  static String? email(String? email) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email!.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(email)) {
      return "Please enter valid email !";
    }
    return null;
  }

  static String? defaultEnterV([dynamic value, String? validateName]) {
    if (value is String && value.isEmpty) {
      return '$validateName';
    }
    return null;
  }
}
