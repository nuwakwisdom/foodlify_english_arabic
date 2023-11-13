import 'package:json_annotation/json_annotation.dart';
part 'banner_list_model.g.dart';

@JsonSerializable()
class BannnerListMoodel {
  BannnerListMoodel({
    required this.body,
  });
  factory BannnerListMoodel.fromJson(Map<String, dynamic> json) =>
      _$BannnerListMoodelFromJson(json);

  final List<String>? body;

  Map<String, dynamic> toJson() => _$BannnerListMoodelToJson(this);
}
