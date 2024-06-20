import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String id;
  final String phone;
  final String userTag;
  final String birthday;
  final String lastName;
  final String firstName;
  final String position;
  final String avatarUrl;
  final String department;

  Employee(
      {required this.id,
      required this.phone,
      required this.userTag,
      required this.birthday,
      required this.lastName,
      required this.firstName,
      required this.position,
      required this.avatarUrl,
      required this.department});

  @override
  List<Object?> get props => [
        id,
        phone,
        userTag,
        birthday,
        lastName,
        firstName,
        position,
        avatarUrl,
        department
      ];
}
