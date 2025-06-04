import 'package:flutter/material.dart';
import 'package:utilidades/src/models/menu_model.dart';

final List<MenuModel> appMenuItems = [
  MenuModel(title: "Home", icon: Icons.home, route: "/Home", page: const HomeView()),
];