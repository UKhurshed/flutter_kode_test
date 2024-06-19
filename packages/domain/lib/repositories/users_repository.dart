import 'package:domain/entities/users/employee.dart';

abstract class UsersRepository {
  Future<Employee> employees();
}