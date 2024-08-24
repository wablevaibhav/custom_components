import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class CustomButtonLoadingWidget extends StatelessWidget {
  const CustomButtonLoadingWidget(
      {super.key, this.width, this.height, this.radius});

  final double? width, height, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      alignment: Alignment.center,
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.blue, size: UIHelpers.screenWidth(context) * 0.1),
    );
  }
}
