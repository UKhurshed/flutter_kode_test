import 'package:domain/domain.dart';
import 'package:api/api.dart';
import 'package:repository/mappers/users/employee_mapper.dart';
import 'package:repository/request_handler.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required UsersService usersService,
  }) : _service = usersService;

  final UsersService _service;

  @override
  Future<List<Employee>> employees() async {
    return handleRequest<UsersResponse, List<Employee>>(
      () => _service.getUsers(),
      (input) => input.asDomainEntity,
    );
  }
}
