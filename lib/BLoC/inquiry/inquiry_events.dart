abstract class CountryEvents {}

class FetchCountry extends CountryEvents {}

abstract class ServiceEvents {}

class FetchServices extends ServiceEvents {}

class FetchServicesByAdmin extends ServiceEvents {}

abstract class InquiryEvents {}

class SubmitInquiry extends InquiryEvents {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phone;
  final String companyName;
  final String service;
  final String country;
  final String jobTitle;
  final String jobDetails;

  SubmitInquiry(
      {required this.firstName,
      required this.lastName,
      required this.companyName,
      required this.service,
      required this.emailAddress,
      required this.phone,
      required this.country,
      required this.jobTitle,
      required this.jobDetails});
}

class FetchOpenedInquiresByAdmin extends InquiryEvents {}

class FetchClosedInquiresByAdmin extends InquiryEvents {}

class FilterOpenedInquiriesByAdmin extends InquiryEvents {
  final String keyword;
  final bool isSearch;

  FilterOpenedInquiriesByAdmin({required this.keyword, required this.isSearch});
}

class FilterClosedInquiriesByAdmin extends InquiryEvents {
  final String keyword;
  final bool isSearch;

  FilterClosedInquiriesByAdmin({required this.keyword, required this.isSearch});
}
