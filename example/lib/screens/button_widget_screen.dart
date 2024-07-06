import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class ButtonWidgetScreen extends StatelessWidget {
  const ButtonWidgetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Custom Button',
              style: CustomTextStyle.subHeadingH5
                  .copyWith(color: CustomColors.black)),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              buttonType: ButtonType.primary,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              buttonType: ButtonType.primaryOutline,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              buttonType: ButtonType.primaryText,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              textDecoration: TextDecoration.underline,
              buttonType: ButtonType.darkText,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              buttonType: ButtonType.dark,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Hello Everyone',
              onPressed: () {},
              buttonType: ButtonType.darkOutline,
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
