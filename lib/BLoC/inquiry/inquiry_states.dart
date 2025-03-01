import 'package:flutter/material.dart';

abstract class CountryStates {}

class CountryInitial extends CountryStates {}

class CountryLoading extends CountryStates {}

class CountryError extends CountryStates {
  final String message;

  CountryError(this.message);
}

class CountryLoaded extends CountryStates {
  final List<DropdownMenuItem<String>> countries;

  CountryLoaded(this.countries);
}

abstract class InquirySubmissionStates {}

class InquirySubmissionInitial extends InquirySubmissionStates {}

class InquirySubmissionLoading extends InquirySubmissionStates {}

class InquirySubmitted extends InquirySubmissionStates {
  final String message;

  InquirySubmitted(this.message);
}

class InquirySubmissionError extends InquirySubmissionStates {
  final String message;

  InquirySubmissionError(this.message);
}
