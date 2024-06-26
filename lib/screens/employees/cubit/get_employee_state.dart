part of 'get_employee_cubit.dart';

@freezed
class GetEmployeeState with _$GetEmployeeState {
  const GetEmployeeState._();

  const factory GetEmployeeState._internal(
      {required Result<List<Employee>> employees,
      required bool isEmptyTextField}) = _GetEmployeeState;

  factory GetEmployeeState.initial() => const GetEmployeeState._internal(
      employees: Initial(), isEmptyTextField: true);
}
