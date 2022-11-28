import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  ErrorModel({this.fields, this.message});
  final Map<String, dynamic>? fields;
  final String? message;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  ErrorResponse(this.error);

  ErrorModel error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}


/*
ErrorResponse errorFromResponse(String str) =>
    ErrorResponse.fromJson(json.decode(str));

class ErrorResponse {
  ErrorModel error;

  ErrorResponse({
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: ErrorModel.fromJson(json["error"]),
      );
  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
      };
}

class ErrorModel {
  ErrorModel({
    this.fields,
  });
  final Map<String, dynamic>? fields;

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    var test = (json["fields"] as Map);
    return ErrorModel(fields: json["fields"]);
  }

  Map<String, dynamic> toJson() => {"fields": Map<String, dynamic>};

/*
  factory ErrorModel.fromResponse(String repsone) {
    final resError = (jsonDecode(repsone) as Map).map((key, value) => MapEntry(
        key as String,
        (value as Map<String, dynamic>).map((key, value) =>
            MapEntry(key as String, value as Map<String, dynamic>))));
    final Map<String, dynamic>? resFields;

    return ErrorModel();
  }
  */

}
  */