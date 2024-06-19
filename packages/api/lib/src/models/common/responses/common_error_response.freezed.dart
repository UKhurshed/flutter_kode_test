// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonErrorResponse _$CommonErrorResponseFromJson(Map<String, dynamic> json) {
  return _CommonErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$CommonErrorResponse {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonErrorResponseCopyWith<CommonErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonErrorResponseCopyWith<$Res> {
  factory $CommonErrorResponseCopyWith(
          CommonErrorResponse value, $Res Function(CommonErrorResponse) then) =
      _$CommonErrorResponseCopyWithImpl<$Res, CommonErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$CommonErrorResponseCopyWithImpl<$Res, $Val extends CommonErrorResponse>
    implements $CommonErrorResponseCopyWith<$Res> {
  _$CommonErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonErrorResponseImplCopyWith<$Res>
    implements $CommonErrorResponseCopyWith<$Res> {
  factory _$$CommonErrorResponseImplCopyWith(_$CommonErrorResponseImpl value,
          $Res Function(_$CommonErrorResponseImpl) then) =
      __$$CommonErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$CommonErrorResponseImplCopyWithImpl<$Res>
    extends _$CommonErrorResponseCopyWithImpl<$Res, _$CommonErrorResponseImpl>
    implements _$$CommonErrorResponseImplCopyWith<$Res> {
  __$$CommonErrorResponseImplCopyWithImpl(_$CommonErrorResponseImpl _value,
      $Res Function(_$CommonErrorResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$CommonErrorResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonErrorResponseImpl implements _CommonErrorResponse {
  const _$CommonErrorResponseImpl(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'message') required this.message});

  factory _$CommonErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonErrorResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'CommonErrorResponse(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonErrorResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonErrorResponseImplCopyWith<_$CommonErrorResponseImpl> get copyWith =>
      __$$CommonErrorResponseImplCopyWithImpl<_$CommonErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _CommonErrorResponse implements CommonErrorResponse {
  const factory _CommonErrorResponse(
          {@JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'message') required final String message}) =
      _$CommonErrorResponseImpl;

  factory _CommonErrorResponse.fromJson(Map<String, dynamic> json) =
      _$CommonErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CommonErrorResponseImplCopyWith<_$CommonErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
