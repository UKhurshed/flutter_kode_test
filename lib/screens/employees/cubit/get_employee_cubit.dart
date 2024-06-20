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

  Future<void> getEmployees() async {
    await produceResult(
      callback: () async {
        final employees = await _usersRepository.employees();
        return employees;
      },
      emitter: (result) => emit(
        state.copyWith(employees: result),
      ),
    );
  }
}
