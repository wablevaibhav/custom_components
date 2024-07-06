import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Custom Button Icon',
              style: CustomTextStyle.subHeadingH6
                  .copyWith(color: CustomColors.black)),
          const Gap(10),
          CustomButtonIcon(
            size: 30,
            icon: CustomIcons.home,
            onPressed: () {},
            iconColor: CustomColors.bluePrimary,
          ),
          const Gap(20),
          Text('Custom Tooltip',
              style: CustomTextStyle.subHeadingH6
                  .copyWith(color: CustomColors.black)),
          const Gap(10),
          CustomTooltip(
            backgroundColor: CustomColors.blueSecondary,
            message: 'Menu Icon is disabled',
            width: UIHelpers.screenWidth(context) * 0.4,
            isMobile: false,
            child: CustomButtonIcon(
              icon: CustomIcons.info,
              iconColor: CustomColors.black,
              onPressed: () {},
            ),
          ),
          const Gap(20),
          Text('Custom Text Field',
              style: CustomTextStyle.subHeadingH6
                  .copyWith(color: CustomColors.black)),
          const Gap(20),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              SizedBox(
                // width: UIHelpers.screenWidth(context) * 0.2,
                child: CustomTextInput(
                  hint: 'Enter your name',
                  label: 'Name',
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                // width: UIHelpers.screenWidth(context) * 0.2,
                child: CustomTextInput(
                  hint: 'Enter your Mobile Number',
                  label: 'Phone Number',
                  maxLength: 10,
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                // width: UIHelpers.screenWidth(context) * 0.2,
                child: CustomTextInput(
                    hint: 'Enter your password',
                    label: 'Password',
                    maxLines: 1,
                    obscureText: isPasswordVisible,
                    suffixIcon: CustomButtonIcon(
                      icon: isPasswordVisible == true
                          ? CustomIcons.passwordShow
                          : CustomIcons.passwordHide,
                      size: 30,
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Password is required';
                      } else if ((value?.length ?? 0) < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    }),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            child: CustomTextInput(
              hint: 'Enter details',
              maxLines: 5,
              maxLength: 2000,
              label: 'Description',
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Name is required';
                }
                return null;
              },
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
