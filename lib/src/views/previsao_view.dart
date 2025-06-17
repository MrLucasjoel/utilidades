import 'package:flutter/material.dart';

class PrevisaoView extends StatefulWidget {
  const PrevisaoView({super.key});

  @override
  State<PrevisaoView> createState() => _PrevisaoViewState();
}

class _PrevisaoViewState extends State<PrevisaoView> {
  String _location = "Carregando...";
  String _temperature = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text("Previsão do Tempo"),
     ),
     body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _location,
              style: const TextStyle(fontSize: 24),
          ),
          Text(
              _temperature,
              style: const TextStyle(fontSize: 48),
            ),
          ]
        ),
      ),
    );
  }
}