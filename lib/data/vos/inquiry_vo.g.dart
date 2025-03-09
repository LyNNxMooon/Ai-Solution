// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryVO _$InquiryVOFromJson(Map<String, dynamic> json) => InquiryVO(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  emailAddress: json['emailAddress'] as String,
  companyName: json['companyName'] as String,
  service: json['service'] as String,
  country: json['country'] as String,
  jobTitle: json['jobTitle'] as String,
  jobDetails: json['jobDetails'] as String,
);

Map<String, dynamic> _$InquiryVOToJson(InquiryVO instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'emailAddress': instance.emailAddress,
  'companyName': instance.companyName,
  'service': instance.service,
  'country': instance.country,
  'jobTitle': instance.jobTitle,
  'jobDetails': instance.jobDetails,
};
