// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'current_solution_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentSolutionVO _$CurrentSolutionVOFromJson(Map<String, dynamic> json) =>
    CurrentSolutionVO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CurrentSolutionVOToJson(CurrentSolutionVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'description': instance.description,
    };
