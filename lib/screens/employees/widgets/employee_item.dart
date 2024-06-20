import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key, required this.data});

  final Employee data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _EmployeeAvatar(avatarUrl: data.avatarUrl),
              const SizedBox(width: 16),
              _EmployeeUserName(data: data)
            ],
          )),
    );
  }
}

class _EmployeeAvatar extends StatelessWidget {
  const _EmployeeAvatar({required this.avatarUrl});

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, image) {
        return Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
              shape: BoxShape.circle, image: DecorationImage(image: image)),
        );
      },
    );
  }
}

class _EmployeeUserName extends StatelessWidget {
  const _EmployeeUserName({required this.data});

  final Employee data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${data.firstName} ${data.lastName}"),
        Text(data.position)
      ],
    );
  }
}
