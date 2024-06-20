import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final onBgColor = Theme.of(context).colorScheme.onSurface;
    return Shimmer.fromColors(
        baseColor: onBgColor.withOpacity(0.1),
        highlightColor: onBgColor.withOpacity(0.04),
        child: child);
  }
}