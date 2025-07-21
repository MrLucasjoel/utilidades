import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utilidades/src/models/menu_model.dart';
import 'package:utilidades/src/views/Temperature_view.dart';
import 'package:utilidades/src/views/about_view.dart';
import 'package:utilidades/src/views/configuracao_view.dart';
import 'package:utilidades/src/views/converter_view.dart';
import 'package:utilidades/src/views/home_view.dart';
import 'package:utilidades/src/views/login_river.dart';
import 'package:utilidades/src/views/person_view.dart';
import 'package:utilidades/src/views/product_list_page.dart';
import 'package:utilidades/src/views/riverpod_exemple.dart';

final List<MenuModel> appMenuItems = [
  MenuModel(
    title: "Home",
    icon: Icons.home,
    route: "/home",
    page: const HomeView(),
  ),

  MenuModel(
    title: "Sobre mim",
    icon: Icons.person_sharp,
    route: "/about",
    page: AboutView(),
  ),

  MenuModel(
    title: "Conversor de medidas",
    icon: Icons.design_services,
    route: "/convertermedidas",
    page: ConverterView(),
  ),

   MenuModel(
    title: "Previsao de Temperatura",
    icon: Icons.thermostat_auto,
    route: "/previsaodetemperature",
    page: TemperatureView(),
  ),

  MenuModel(
    title: "Produtos",
    icon: Icons.production_quantity_limits,
    route: "/produtos",
    page: ProductListPage(),
  ),

  MenuModel(
    title: "Pessoas (sqlite)",
    icon: Icons.people,
    route: "/pessoas",
    page: PersonView(),
  ),

  MenuModel(
    title: "Riverpod",
    icon: Icons.settings,
    route: "/riverpod",
    page: ProviderScope(child: RiverpodExemple()),
  ),

  MenuModel(
    title: "Login River",
    icon: Icons.settings,
    route: "/loginriver",
    page: ProviderScope(child: LoginRiver()),
  ),

  MenuModel(
    title: "Configurações",
    icon: Icons.settings,
    route: "/configuracoes",
    page: ConfiguracaoView(),
  ),
];
