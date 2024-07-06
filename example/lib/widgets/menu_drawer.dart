import 'package:custom_components/custom_components.dart';
import 'package:example/service/common_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDrawerWidget extends StatelessWidget {
  final String name;
  final String email;
  const MenuDrawerWidget({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: UIHelpers.screenWidth(context) * 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: Colors.black,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              accountName: Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
              accountEmail: Text(email),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: CustomColors.white,
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 30.0, color: CustomColors.black),
                ), //Text
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuIndex == 0
                          ? true
                          : false,
                  selectedTileColor: Colors.grey,
                  selectedColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuIndex(0);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuIndex == 1
                          ? true
                          : false,
                  selectedTileColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedColor: Colors.white,
                  leading: const Icon(Icons.widgets_rounded),
                  title: const Text('Buttons'),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuIndex(1);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuIndex == 2
                          ? true
                          : false,
                  selectedTileColor: Colors.grey,
                  selectedColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.widgets_rounded),
                  title: const Text('Alert Dialogs'),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuIndex(2);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuIndex == 3
                          ? true
                          : false,
                  selectedTileColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedColor: Colors.white,
                  leading: const Icon(Icons.video_label),
                  title: const Text(' Saved Videos '),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuIndex(3);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuIndex == 4
                          ? true
                          : false,
                  selectedTileColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedColor: Colors.white,
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuIndex(4);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Provider.of<CommonService>(context).selectedMenuIndex == 5
              ? UIHelpers.horizontalSpaceTiny
              : UIHelpers.listDivider,
          ListTile(
            selected: Provider.of<CommonService>(context).selectedMenuIndex == 5
                ? true
                : false,
            selectedTileColor: Colors.grey,
            selectedColor: Colors.white,
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
            ),
            onTap: () {
              Provider.of<CommonService>(context, listen: false)
                  .setSelectedMenuIndex(5);
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    title: Text(
                      'Logout',
                      style: CustomTextStyle.regularTextStyle,
                    ),
                    content: Text(
                      'Are you sure you want to logout?',
                      style: CustomTextStyle.regularTextStyle,
                    ),
                    actions: [
                      CustomButton(
                        buttonType: ButtonType.dark,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'No',
                        textStyle: CustomTextStyle.button
                            .copyWith(color: CustomColors.white),
                      ),
                      CustomButton(
                        buttonType: ButtonType.dark,
                        onPressed: () {
                          Provider.of<CommonService>(context, listen: false)
                              .setSelectedMenuIndex(0);
                          Navigator.pop(context);
                        },
                        text: 'Yes',
                        textStyle: CustomTextStyle.button
                            .copyWith(color: CustomColors.white),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
