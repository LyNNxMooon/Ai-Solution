import 'package:ai_solution/data/vos/inquiry_vo.dart';
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

abstract class ServiceStates {}

class ServiceInitial extends ServiceStates {}

class ServiceLoading extends ServiceStates {}

class ServiceError extends ServiceStates {
  final String message;

  ServiceError(this.message);
}

class ServiceLoaded extends ServiceStates {
  final List<DropdownMenuItem<String>> services;

  ServiceLoaded(this.services);
}

class ServicesLoadedByAdmin extends ServiceStates {
  final List<String> services;

  ServicesLoadedByAdmin(this.services);
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

abstract class OpenInquiryStates {}

class OpenInquiryInitial extends OpenInquiryStates {}

class OpenInquiryLoading extends OpenInquiryStates {}

class OpenedInquiryError extends OpenInquiryStates {
  final String message;

  OpenedInquiryError(this.message);
}

class OpenedInquiriesLoaded extends OpenInquiryStates {
  final List<InquiryVO> openedInquiries;

  OpenedInquiriesLoaded(this.openedInquiries);
}

abstract class ClosedInquiryStates {}

class ClosedInquiryInitial extends ClosedInquiryStates {}

class ClosedInquiryLoading extends ClosedInquiryStates {}

class ClosedInquiryError extends ClosedInquiryStates {
  final String message;

  ClosedInquiryError(this.message);
}

class ClosedInquiriesLoaded extends ClosedInquiryStates {
  final List<InquiryVO> closedInquires;

  ClosedInquiriesLoaded(this.closedInquires);
}

abstract class InquiryUpdateStates {}

class InquiryUpdateInitial extends InquiryUpdateStates {}

class InquiryUpdateLoading extends InquiryUpdateStates {}

class InquiryUpdated extends InquiryUpdateStates {
  final String message;

  InquiryUpdated(this.message);
}

class InquiryUpdateError extends InquiryUpdateStates {
  final String message;

  InquiryUpdateError(this.message);
}
