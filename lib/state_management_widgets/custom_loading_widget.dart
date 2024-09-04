import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0.0,
    this.borderRadius = BorderRadius.zero,
  });

  final BorderRadius? borderRadius;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius != 0.0
          ? BorderRadius.circular(radius)
          : borderRadius ?? BorderRadius.zero,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).highlightColor,
        highlightColor: Theme.of(context).highlightColor,
        child: Container(
          width: width,
          height: height,
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
