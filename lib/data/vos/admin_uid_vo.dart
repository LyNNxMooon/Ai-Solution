
import 'package:json_annotation/json_annotation.dart';
part 'admin_uid_vo.g.dart';

@JsonSerializable()
class AdminUidVO {

  final String id;

  AdminUidVO({required this.id});


   factory AdminUidVO.fromJson(Map<String, dynamic> json) =>
      _$AdminUidVOFromJson(json);

  Map<String, dynamic> toJson() => _$AdminUidVOToJson(this);
}