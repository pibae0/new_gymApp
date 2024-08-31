import 'package:flutter/material.dart';
import 'package:gym_new_app/utils/const_colors.dart';
import 'package:gym_new_app/data/side_menu_data.dart';
import 'package:gym_new_app/models/menu_model.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => SideMenuWidgetState();
}

class SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      color: backgroundMenuColors,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;
    MenuModel dataMenu = data.menu[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                dataMenu.icon,
                color: isSelected ? Colors.amber : Colors.grey,
              ),
            ),
            Text(
              dataMenu.title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.amber : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
