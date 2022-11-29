import 'package:json_annotation/json_annotation.dart';
part 'client_model.g.dart';

@JsonSerializable()
class ClientModel {
  const ClientModel({required this.id, required this.title});
  final String id;
  final String title;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}
