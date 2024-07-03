import 'package:custom_components/custom_components.dart';
import 'package:flutter/widgets.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'No Data Found!!',
          style: CustomTextStyle.normal,
        ),
      ),
    );
  }
}
