import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
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
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 4, // Blur radius
                offset: const Offset(2, 3), // Offset of the shadow
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
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.205,
                      height: 60,
                      child: formfield("First Name", "First Name", 1)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.205,
                      height: 60,
                      child: formfield("Surname", "Surname", 1))
                ],
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield("Email Address", "Email Address", 1),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield("Compnay Name", "Compnay Name", 1),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield("Country", "Country", 1),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: formfield("Job Title", "Job Title", 1),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                //height: 60,
                child: formfield("Job Details", "Job Details", 10),
              ),
              const Gap(40),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(kMessageBubbleColor),
                        foregroundColor: WidgetStatePropertyAll(kFourthColor)),
                    onPressed: () {},
                    child: Text("Submitt")),
              )
            ],
          ),
        ),
        const Gap(120),
      ],
    );
  }

  Widget formfield(String hintText, String label, int? maxLines) {
    return TextFormField(
        style: TextStyle(fontSize: 12),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
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
