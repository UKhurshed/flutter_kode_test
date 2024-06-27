import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeAvatarView extends StatelessWidget {
  const EmployeeAvatarView({super.key, required this.avatarUrl});

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: Container(
            height: 104,
            width: 104,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey)),
      ),
      errorWidget: (context, url, error) => Container(
        height: 104,
        width: 104,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: const Icon(Icons.person, size: 38),
      ),
      imageBuilder: (context, image) => Container(
        height: 104,
        width: 104,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: image),
        ),
      ),
    );
  }
}