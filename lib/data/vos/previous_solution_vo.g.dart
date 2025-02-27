// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_solution_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousSolutionVO _$PreviousSolutionVOFromJson(Map<String, dynamic> json) =>
    PreviousSolutionVO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      clientID: (json['client_id'] as num).toInt(),
    );

// ignore: unused_element
Map<String, dynamic> _$PreviousSolutionVOToJson(PreviousSolutionVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'description': instance.description,
      'client_id': instance.clientID,
    };
