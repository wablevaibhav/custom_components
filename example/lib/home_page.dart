import 'package:custom_components/custom_components.dart';
import 'package:example/service/common_service.dart';
import 'package:example/service/screen_service.dart';
import 'package:example/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CustomMenuType { home, logout }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawerWidget(
        email: 'vaibhav@gmail.com',
        name: 'Sanket Wable',
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? NavigationBar(
              elevation: 0,
              height: 80,
              backgroundColor: CustomColors.white,
              indicatorColor: CustomColors.bluePrimary.withOpacity(0.1),
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
                if (selectedIndex == 2) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        builder: (context, scrollController) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            color: CustomColors.white,
                            child: ListView(
                              controller: scrollController,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text('Settings'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.info),
                                  title: const Text('About'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.help),
                                  title: const Text('Help'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(CustomIcons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(CustomIcons.mobile), label: 'Mobile'),
                NavigationDestination(
                    icon: Icon(CustomIcons.menu), label: 'Menu'),
                NavigationDestination(
                    icon: Icon(CustomIcons.setting), label: 'Settings'),
                NavigationDestination(
                    icon: Icon(CustomIcons.passwordShow), label: 'Profile'),
              ],
              selectedIndex: selectedIndex,
            )
          : null,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.white),
        backgroundColor: CustomColors.bluePrimary,
        title: Text(
          'Custom Components',
          style: CustomTextStyle.subHeadingH6.copyWith(
            color: CustomColors.white,
          ),
        ),
        centerTitle: Responsive.isMobile(context) ? true : false,
      ),
      body: getScreen(Provider.of<CommonService>(context).selectedMenuIndex),
    );
  }
}
