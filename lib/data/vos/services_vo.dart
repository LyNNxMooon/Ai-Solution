
import 'package:json_annotation/json_annotation.dart';
part 'services_vo.g.dart';

@JsonSerializable()
class ServicesVO {
  final int id;
  final String name;

  ServicesVO({required this.id, required this.name});

    factory ServicesVO.fromJson(Map<String, dynamic> json) =>
      _$ServicesVOFromJson(json);

}