import 'package:custom_components/custom_components.dart';
import 'package:flutter/widgets.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String? title;
  const CustomEmptyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title ?? 'No Data Found!!',
          style: CustomTextStyle.normal,
        ),
      ),
    );
  }
}
