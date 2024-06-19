import 'package:api/src/api_impl/models/users/responses/users_response_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';

part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    @JsonKey(name: 'items') required UsersResponseObject data,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}