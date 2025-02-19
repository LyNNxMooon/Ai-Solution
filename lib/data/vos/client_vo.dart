import 'package:json_annotation/json_annotation.dart';
part 'client_vo.g.dart';

@JsonSerializable()
class ClientVO {
  final int id;
  final String name;
  final String url;

  ClientVO({required this.id, required this.name, required this.url});

  factory ClientVO.fromJson(Map<String, dynamic> json) =>
      _$ClientVOFromJson(json);
}
