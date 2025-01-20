import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:indopustaka/app/routes/app_pages.dart';

class IndopustakaDrawer extends GetView {
  const IndopustakaDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 96.0,
                      color: Colors.white,
                    ),
                    Text(
                      'Drawer Header',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IndopustakaDrawerItem(
            'Home',
            Icons.home,
            () {
              changeScreen(Routes.home);
            },
          ),
          IndopustakaDrawerItem(
            'Profile',
            Icons.account_circle_rounded,
            () {
              changeScreen(Routes.profile);
            },
          ),
          // IndopustakaDrawerItem(
          //   'History',
          //   Icons.history,
          //   () {
          //     changeScreen(Routes.history);
          //   },
          // ),
          // IndopustakaDrawerItem(
          //   'Settings',
          //   Icons.settings,
          //   () {
          //     changeScreen(Routes.setting);
          //   },
          // ),
        ],
      ),
    );
  }

  void changeToScreen(String route) {
    Get.toNamed(route);
  }

  void changeScreen(String route) {
    Get.offAllNamed(route);
  }
}

class IndopustakaDrawerItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function() onTap;

  const IndopustakaDrawerItem(this.title, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
