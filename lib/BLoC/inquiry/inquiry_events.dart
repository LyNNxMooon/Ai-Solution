abstract class CountryEvents {}

class FetchCountry extends CountryEvents {}

abstract class InquiryEvents {}

class SubmitInquiry extends InquiryEvents {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String companyName;
  final String country;
  final String jobTitle;
  final String jobDetails;

  SubmitInquiry(
      {required this.firstName,
      required this.lastName,
      required this.companyName,
      required this.emailAddress,
      required this.country,
      required this.jobTitle,
      required this.jobDetails});
}
