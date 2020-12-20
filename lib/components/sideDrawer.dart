import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:menu/main.dart';
import 'package:menu/models/menu.dart';

class SideDrawer extends StatelessWidget {
  final List<Menu> menu;
  SideDrawer({this.menu});
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      ...Set.from(menu.map((item) => item.category))
    ];
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('Menu Category', style: TextStyle(fontSize: 16)),
            ),
          ),
          ...(categories.map((category) {
            return MaterialButton(
              child: Text(category),
              onPressed: () => {
                context.read(categoryProvider).state = category,
                Navigator.pop(context)
              },
            );
          }))
        ],
      ),
    );
  }
}
