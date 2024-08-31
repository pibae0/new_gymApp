import 'package:flutter/material.dart';
import 'package:gym_new_app/models/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'HomeScreen'),
    MenuModel(icon: Icons.person, title: 'Alunos'),
    MenuModel(icon: Icons.run_circle, title: 'Treinos'),
    MenuModel(icon: Icons.settings, title: 'Opções'),
    MenuModel(icon: Icons.history, title: 'Historico'),
    MenuModel(icon: Icons.logout, title: 'Sair'),
  ];
}
