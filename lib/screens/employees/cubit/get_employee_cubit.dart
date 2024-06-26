import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_kode_test/utils/result/result.dart';
import 'package:flutter_kode_test/utils/result/result_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_employee_state.dart';

part 'get_employee_cubit.freezed.dart';

class GetEmployeeCubit extends Cubit<GetEmployeeState> {
  GetEmployeeCubit({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(GetEmployeeState.initial());

  final UsersRepository _usersRepository;

  List<Employee> _localEmployee = [];

  Future<void> getEmployees() async {
    await produceResult(callback: () async {
      final employees = await _usersRepository.employees();
      return employees;
    }, emitter: (result) {
      _localEmployee.clear();
      _localEmployee = result.data ?? [];
      return emit(
        state.copyWith(employees: result),
      );
    });
  }

  filterEmployee(String searchQuery) {
    final searched = _localEmployee
        .where((element) => element.firstName.contains(searchQuery))
        .toList();

    emit(state.copyWith(employees: Success(data: searched)));
  }

  clearState() {
    emit(state.copyWith(employees: Success(data: _localEmployee)));
  }

  setTextFieldStatus(bool isEmpty) {
    emit(state.copyWith(isEmptyTextField: isEmpty));
  }
}
