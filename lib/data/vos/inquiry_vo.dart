import 'package:json_annotation/json_annotation.dart';
part 'inquiry_vo.g.dart';

@JsonSerializable()
class InquiryVO {
  final int id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phone;
  final String companyName;
  final String service;
  final String country;
  final String jobTitle;
  final String jobDetails;
  bool isOpened;

  InquiryVO(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.phone,
      required this.companyName,
      required this.service,
      required this.country,
      required this.jobTitle,
      required this.jobDetails,
      required this.isOpened});

  factory InquiryVO.fromJson(Map<String, dynamic> json) =>
      _$InquiryVOFromJson(json);

        Map<String, dynamic> toJson() => _$InquiryVOToJson(this);
}
