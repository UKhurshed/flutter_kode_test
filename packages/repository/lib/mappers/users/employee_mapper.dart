import 'package:api/api.dart';
import 'package:domain/domain.dart';

extension EmployeeMapper on UsersResponse {
  List<Employee> get asDomainEntity {
    return data
        .map((e) => Employee(
            id: e.id,
            phone: e.phone,
            userTag: e.userTag,
            birthday: e.birthday,
            lastName: e.lastName,
            firstName: e.firstName,
            position: e.position,
            avatarUrl: e.avatarUrl,
            department: e.department))
        .toList();
  }
}
