import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Custom Alert Dialog',
              style: CustomTextStyle.subHeadingH5
                  .copyWith(color: CustomColors.black)),
          const Gap(20),
          Column(
            children: [
              CustomAlert.style(
                  style: CustomAlertStyle.success,
                  title: "Success!",
                  message: "You may now proceed with your workflow"),
              const Gap(10),
              CustomAlert.style(
                style: CustomAlertStyle.info,
                title: "Tip!",
                message:
                    "You can now have cover images on blog pages. Drafts will now auto-save while writing",
                titleTextStyle: CustomTextStyle.small,
                messageTextStyle: CustomTextStyle.small.medium500(),
              ),
              const Gap(10),
              CustomAlert.style(
                style: CustomAlertStyle.warning,
                title: "Warning!",
                message: "You must register before you can do that.",
              ),
              const Gap(10),
              CustomAlert.style(
                style: CustomAlertStyle.danger,
                title: "Oops!",
                message:
                    "There was an error retrieving this resource. Click here to try again.",
              ),
            ],
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
