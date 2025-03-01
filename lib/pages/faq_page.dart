// ignore_for_file: deprecated_member_use

import 'package:ai_solution/BLoC/inquiry/inquiry_bloc.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_states.dart';
import 'package:ai_solution/constant/colors.dart';
import 'package:ai_solution/utils/navigation_extension.dart';
import 'package:ai_solution/widgets/error_dialog.dart';
import 'package:ai_solution/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String? _dropdownCountryValue;

  void dropdownCallBack(String? selectedValue) {
    setState(() {
      _dropdownCountryValue = selectedValue;
    });
  }

  late final inquirySubmissionBloc = context.read<InquirySubmissionBloc>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _compnayNameController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _jobDetailsController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _compnayNameController.dispose();
    _jobDetailsController.dispose();
    _jobDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(125),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.24),
          padding: EdgeInsets.all(80),
          height: MediaQuery.of(context).size.height * 1.05,
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
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "I n q u i r y   F o r m",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              const Gap(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: formfield("First Name", "First Name", 1,
                            _firstNameController)),
                  ),
                  const Gap(15),
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: formfield(
                            "Surname", "Surname", 1, _lastNameController)),
                  )
                ],
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield(
                    "Email Address", "Email Address", 1, _emailController),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield(
                    "Company Name", "Company Name", 1, _compnayNameController),
              ),
              const Gap(20),
              // SizedBox(
              //   width: double.infinity,
              //   height: 60,
              //   child: formfield("Country", "Country", 1),
              // ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 50,
                  child: BlocBuilder<CountryBloc, CountryStates>(
                    builder: (context, state) {
                      if (state is CountryLoaded) {
                        //_dropdownCountryValue = state.countries[0].value;
                        return DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              "Choose Country",
                              style: TextStyle(color: kFourthColor),
                            ),
                            value: _dropdownCountryValue,
                            items: state.countries,
                            onChanged: (value) => dropdownCallBack(value),
                            isExpanded: true,
                            style: TextStyle(color: kFourthColor),
                            dropdownColor: Colors.white,
                          ),
                        );
                      } else {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton(
                            //value: _dropdownCountryValue,
                            items: null,
                            onChanged: null,
                            isExpanded: true,
                            style: TextStyle(color: kFourthColor),
                            dropdownColor: Colors.white,
                          ),
                        );
                      }
                    },
                  )),
              const Gap(30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child:
                    formfield("Job Title", "Job Title", 1, _jobTitleController),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                //height: 60,
                child: formfield(
                    "Job Details", "Job Details", 10, _jobDetailsController),
              ),
              const Gap(40),
              Align(
                  alignment: Alignment.centerLeft,
                  child: BlocConsumer<InquirySubmissionBloc,
                      InquirySubmissionStates>(
                    builder: (context, state) {
                      if (state is InquirySubmissionLoading) {
                        return CupertinoActivityIndicator();
                      } else {
                        return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kMessageBubbleColor),
                                foregroundColor:
                                    WidgetStatePropertyAll(kFourthColor)),
                            onPressed: () => inquirySubmissionBloc.add(
                                SubmitInquiry(
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    companyName: _compnayNameController.text,
                                    emailAddress: _emailController.text,
                                    country: _dropdownCountryValue ?? "",
                                    jobTitle: _jobTitleController.text,
                                    jobDetails: _jobDetailsController.text)),
                            child: Text("Submitt"));
                      }
                    },
                    listener: (context, state) {
                      if (state is InquirySubmitted) {
                        showDialog(
                          context: context,
                          builder: (context) => SuccessWidget(
                            message: state.message,
                            function: () {
                              _firstNameController.clear();
                              _lastNameController.clear();
                              _emailController.clear();
                              _compnayNameController.clear();
                              dropdownCallBack(null);
                              _jobTitleController.clear();
                              _jobDetailsController.clear();

                              context.navigateBack();
                            },
                          ),
                        );
                      }

                      if (state is InquirySubmissionError) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomErrorWidget(
                            errorMessage: state.message,
                            function: context.navigateBack,
                          ),
                        );
                      }
                    },
                  ))
            ],
          ),
        ),
        const Gap(120),
      ],
    );
  }

  Widget formfield(String hintText, String label, int? maxLines,
      TextEditingController controller) {
    return TextFormField(
        style: TextStyle(fontSize: 12),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
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
