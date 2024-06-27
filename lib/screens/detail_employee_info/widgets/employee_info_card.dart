import 'package:flutter/material.dart';

class EmployeeInfoCard extends StatelessWidget {
  const EmployeeInfoCard(
      {super.key, required this.icon, required this.title, this.birthdate});

  final Icon icon;
  final String title;
  final String? birthdate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Text(title),
          const Spacer(),
          birthdate == null ? const SizedBox.shrink() : Text(birthdate ?? "")
        ],
      ),
    );
  }
}
