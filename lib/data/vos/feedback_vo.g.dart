// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackVO _$FeedbackVOFromJson(Map<String, dynamic> json) => FeedbackVO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$FeedbackVOToJson(FeedbackVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'body': instance.body,
    };
