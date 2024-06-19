import 'package:domain/entities/users/employee.dart';

abstract class UsersRepository {
  Future<List<Employee>> employees();
}