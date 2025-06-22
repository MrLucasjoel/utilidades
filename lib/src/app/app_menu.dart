import 'package:flutter/material.dart';
import 'package:utilidades/src/models/menu_model.dart';
import 'package:utilidades/src/views/Temperature_view.dart';
import 'package:utilidades/src/views/about_view.dart';
import 'package:utilidades/src/views/configuracao_view.dart';
import 'package:utilidades/src/views/converter_view.dart';
import 'package:utilidades/src/views/home_view.dart';

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
    title: "configuracao",
    icon: Icons.settings,
    route: "/configuracao",
    page: ConfiguracaoView(),
  ),
];
