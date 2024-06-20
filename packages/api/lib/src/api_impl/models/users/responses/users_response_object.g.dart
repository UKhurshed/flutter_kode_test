// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersResponseObjectImpl _$$UsersResponseObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$UsersResponseObjectImpl(
      id: json['id'] as String,
      phone: json['phone'] as String,
      userTag: json['userTag'] as String,
      birthday: json['birthday'] as String,
      lastName: json['lastName'] as String,
      position: json['position'] as String,
      avatarUrl: json['avatarUrl'] as String,
      firstName: json['firstName'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$$UsersResponseObjectImplToJson(
        _$UsersResponseObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'userTag': instance.userTag,
      'birthday': instance.birthday,
      'lastName': instance.lastName,
      'position': instance.position,
      'avatarUrl': instance.avatarUrl,
      'firstName': instance.firstName,
      'department': instance.department,
    };
