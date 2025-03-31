import 'package:json_annotation/json_annotation.dart';
part 'client_vo.g.dart';

@JsonSerializable()
class ClientVO {
  final int id;
  String name;
  String url;

  ClientVO({required this.id, required this.name, required this.url});

  factory ClientVO.fromJson(Map<String, dynamic> json) =>
      _$ClientVOFromJson(json);

  Map<String, dynamic> toJson() => _$ClientVOToJson(this);
}
