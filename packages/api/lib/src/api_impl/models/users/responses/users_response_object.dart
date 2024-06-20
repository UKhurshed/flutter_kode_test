import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response_object.freezed.dart';
part 'users_response_object.g.dart';

@freezed
class UsersResponseObject with _$UsersResponseObject {
  const factory UsersResponseObject({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'userTag') required String userTag,
    @JsonKey(name: 'birthday') required String birthday,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'position') required String position,
    @JsonKey(name: 'avatarUrl') required String avatarUrl,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'department') required String department,
  }) = _UsersResponseObject;

  factory UsersResponseObject.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseObjectFromJson(json);
}