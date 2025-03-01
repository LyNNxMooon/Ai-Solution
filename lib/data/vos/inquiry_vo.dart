import 'package:json_annotation/json_annotation.dart';
part 'inquiry_vo.g.dart';

@JsonSerializable()
class InquiryVO {
  final int id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String companyName;
  final String country;
  final String jobTitle;
  final String jobDetails;

  InquiryVO(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.companyName,
      required this.country,
      required this.jobTitle,
      required this.jobDetails});

  factory InquiryVO.fromJson(Map<String, dynamic> json) =>
      _$InquiryVOFromJson(json);

        Map<String, dynamic> toJson() => _$InquiryVOToJson(this);
}
