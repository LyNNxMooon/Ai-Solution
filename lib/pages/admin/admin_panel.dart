// ignore_for_file: prefer_final_fields

import 'package:ai_solution/BLoC/admin_auth/admin_auth_bloc.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_events.dart';
import 'package:ai_solution/BLoC/admin_auth/admin_auth_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/pages/admin/chatting_panel.dart';
import 'package:ai_solution/pages/admin/current_solution_panel.dart';
import 'package:ai_solution/pages/admin/feedback_and_rating_panel.dart';
import 'package:ai_solution/pages/admin/gallery_panel.dart';
import 'package:ai_solution/pages/admin/inquiy_panel.dart';
import 'package:ai_solution/pages/admin/previous_solution_panel.dart';
import 'package:ai_solution/pages/admin/promo_events_panel.dart';
import 'package:ai_solution/pages/admin/upcoming_events_panel.dart';
import 'package:ai_solution/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();

  bool? showPassword = true;

  late final adminAuthBloc = context.read<AdminAuthBloc>();

  int _currentIndex = 0;

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
        body: BlocBuilder<AdminAuthBloc, AdminAuthStates>(
          builder: (context, state) {
            if (state is OTPVerification) {
              return otpVerificationUI();
            } else if (state is OTPLoading) {
              return otpVerificationUI();
            } else if (state is OTPFail) {
              return otpVerificationUI();
            } else if (state is Authenticated) {
              return dashBoard();
            } else {
              return loginUI();
            }
          },
        ));
  }

  Widget dashBoard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: 70,
            height: double.infinity,
            color: const Color.fromRGBO(34, 34, 34, 1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 25,
                    endIndent: 25,
                    height: 50,
                    thickness: 0.3,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      icon: Icon(
                        Icons.inbox_rounded,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      icon: Icon(
                        Icons.messenger_outline_rounded,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      icon: Icon(
                        Icons.electrical_services_outlined,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                      icon: Icon(
                        Icons.work_history_outlined,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 4;
                        });
                      },
                      icon: Icon(
                        Icons.event_available_outlined,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 5;
                        });
                      },
                      icon: Icon(
                        Icons.houseboat_rounded,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 6;
                        });
                      },
                      icon: Icon(
                        Icons.photo,
                        color: kPrimaryColor,
                      )),
                  const Gap(30),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 7;
                        });
                      },
                      icon: Icon(
                        Icons.feedback_rounded,
                        color: kPrimaryColor,
                      )),
                ],
              ),
            ),
          ),
          adminFeaturesUI()
        ],
      ),
    );
  }

  Widget adminFeaturesUI() {
    return _currentIndex == 0
        ? InquiryPanel()
        : _currentIndex == 1
            ? ChattingPanel()
            : _currentIndex == 2
                ? CurrentSolutionPanel()
                : _currentIndex == 3
                    ? PreviousSolutionPanel()
                    : _currentIndex == 4
                        ? UpcomingEventsPanel()
                        : _currentIndex == 5
                            ? PromoEventsPanel()
                            : _currentIndex == 6
                                ? GalleryPanel()
                                : _currentIndex == 7
                                    ? FeedbackAndRatingPanel()
                                    : SizedBox();
  }

  Widget otpVerificationUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
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
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    const Gap(15),
                    Text(
                      "Verify OTP",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Gap(50),
                formfield("OTP", "OTP", 1, _otpController, null, null, null),
                const Gap(30),
                BlocConsumer<AdminAuthBloc, AdminAuthStates>(
                  builder: (context, state) {
                    if (state is OTPLoading) {
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
                          onPressed: () => adminAuthBloc.add(VerifyOTP(
                              otp: _otpController.text, context: context)),
                          child: Text("Verify"));
                    }
                  },
                  listener: (context, state) {
                    if (state is OTPFail) {
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
    );
  }

  Widget loginUI() {
    return Center(
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
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

                    if (state is OTPFail) {
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
