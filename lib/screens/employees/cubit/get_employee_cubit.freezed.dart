// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_employee_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetEmployeeState {
  Result<List<Employee>> get employees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetEmployeeStateCopyWith<GetEmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetEmployeeStateCopyWith<$Res> {
  factory $GetEmployeeStateCopyWith(
          GetEmployeeState value, $Res Function(GetEmployeeState) then) =
      _$GetEmployeeStateCopyWithImpl<$Res, GetEmployeeState>;
  @useResult
  $Res call({Result<List<Employee>> employees});
}

/// @nodoc
class _$GetEmployeeStateCopyWithImpl<$Res, $Val extends GetEmployeeState>
    implements $GetEmployeeStateCopyWith<$Res> {
  _$GetEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_value.copyWith(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as Result<List<Employee>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetEmployeeStateImplCopyWith<$Res>
    implements $GetEmployeeStateCopyWith<$Res> {
  factory _$$GetEmployeeStateImplCopyWith(_$GetEmployeeStateImpl value,
          $Res Function(_$GetEmployeeStateImpl) then) =
      __$$GetEmployeeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<List<Employee>> employees});
}

/// @nodoc
class __$$GetEmployeeStateImplCopyWithImpl<$Res>
    extends _$GetEmployeeStateCopyWithImpl<$Res, _$GetEmployeeStateImpl>
    implements _$$GetEmployeeStateImplCopyWith<$Res> {
  __$$GetEmployeeStateImplCopyWithImpl(_$GetEmployeeStateImpl _value,
      $Res Function(_$GetEmployeeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_$GetEmployeeStateImpl(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as Result<List<Employee>>,
    ));
  }
}

/// @nodoc

class _$GetEmployeeStateImpl extends _GetEmployeeState {
  const _$GetEmployeeStateImpl({required this.employees}) : super._();

  @override
  final Result<List<Employee>> employees;

  @override
  String toString() {
    return 'GetEmployeeState._internal(employees: $employees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEmployeeStateImpl &&
            (identical(other.employees, employees) ||
                other.employees == employees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetEmployeeStateImplCopyWith<_$GetEmployeeStateImpl> get copyWith =>
      __$$GetEmployeeStateImplCopyWithImpl<_$GetEmployeeStateImpl>(
          this, _$identity);
}

abstract class _GetEmployeeState extends GetEmployeeState {
  const factory _GetEmployeeState(
          {required final Result<List<Employee>> employees}) =
      _$GetEmployeeStateImpl;
  const _GetEmployeeState._() : super._();

  @override
  Result<List<Employee>> get employees;
  @override
  @JsonKey(ignore: true)
  _$$GetEmployeeStateImplCopyWith<_$GetEmployeeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
