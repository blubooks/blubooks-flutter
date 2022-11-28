import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
