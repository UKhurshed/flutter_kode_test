import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_error_response.freezed.dart';
part 'common_error_response.g.dart';


@freezed
class CommonErrorResponse with _$CommonErrorResponse {
  const factory CommonErrorResponse({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'message') required String message,
  }) = _CommonErrorResponse;

  factory CommonErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorResponseFromJson(json);
}
