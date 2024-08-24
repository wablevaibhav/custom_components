import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String? title;
  const CustomEmptyWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title ?? 'No Data Found!!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
