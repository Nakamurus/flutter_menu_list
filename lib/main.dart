import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:menu/components/sideDrawer.dart';
import 'dart:convert';

import 'package:menu/models/menu.dart';
import 'package:menu/screens/item.dart';

final categoryProvider = StateProvider((ref) => 'All');

final itemProvider = FutureProvider<List<Menu>>((ref) async {
  final response = await rootBundle.loadString('assets/data/data.json');
  final items = json.decode(response);

  return items.map<Menu>((item) => new Menu.fromJson(item)).toList();
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final category = watch(categoryProvider);
    AsyncValue<List<Menu>> menus = watch(itemProvider);

    List<Menu> toggle(List<Menu> menu) {
      if (category.state == 'All')
        return menu;
      else
        return menu.where((item) => item.category == category.state).toList();
    }

    return MaterialApp(
      title: 'Menu',
      debugShowCheckedModeBanner: false,
      home: menus.when(
          loading: () => Center(child: const CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text(error.toString())),
          data: (menu) {
            final selectedMenu = toggle(menu);
            return Scaffold(
                appBar: AppBar(
                  title: Text('Menu'),
                ),
                drawer: SideDrawer(menu: menu),
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: selectedMenu.length,
                  itemBuilder: (context, int index) {
                    return MenuItem(selectedMenu: selectedMenu[index]);
                  },
                ));
          }),
    );
  }
}
