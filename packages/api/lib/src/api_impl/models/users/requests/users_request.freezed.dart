// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersRequest _$UsersRequestFromJson(Map<String, dynamic> json) {
  return _UsersRequest.fromJson(json);
}

/// @nodoc
mixin _$UsersRequest {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersRequestCopyWith<$Res> {
  factory $UsersRequestCopyWith(
          UsersRequest value, $Res Function(UsersRequest) then) =
      _$UsersRequestCopyWithImpl<$Res, UsersRequest>;
}

/// @nodoc
class _$UsersRequestCopyWithImpl<$Res, $Val extends UsersRequest>
    implements $UsersRequestCopyWith<$Res> {
  _$UsersRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UsersRequestImplCopyWith<$Res> {
  factory _$$UsersRequestImplCopyWith(
          _$UsersRequestImpl value, $Res Function(_$UsersRequestImpl) then) =
      __$$UsersRequestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersRequestImplCopyWithImpl<$Res>
    extends _$UsersRequestCopyWithImpl<$Res, _$UsersRequestImpl>
    implements _$$UsersRequestImplCopyWith<$Res> {
  __$$UsersRequestImplCopyWithImpl(
      _$UsersRequestImpl _value, $Res Function(_$UsersRequestImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UsersRequestImpl implements _UsersRequest {
  const _$UsersRequestImpl();

  factory _$UsersRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersRequestImplFromJson(json);

  @override
  String toString() {
    return 'UsersRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersRequestImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersRequestImplToJson(
      this,
    );
  }
}

abstract class _UsersRequest implements UsersRequest {
  const factory _UsersRequest() = _$UsersRequestImpl;

  factory _UsersRequest.fromJson(Map<String, dynamic> json) =
      _$UsersRequestImpl.fromJson;
}
