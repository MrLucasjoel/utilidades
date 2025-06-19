import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/temperature_controller.dart';
import 'package:utilidades/src/models/temperature_model.dart';

class TemperatureView extends StatefulWidget {
  const TemperatureView({super.key});

  @override
  State<TemperatureView> createState() => _TemperatureViewState();
}

class _TemperatureViewState extends State<TemperatureView> {
  final TemperatureController _controller = TemperatureController();

  TemperatureModel? _initialTemp;
  bool _isLoading = true;
  double? _averageTemp;

  @override
  void initState() {
    super.initState();
    _loadInitialTemperature();
  }

  Future<void> _loadInitialTemperature() async {
    final temp = await _controller.fetchInitialTemperature();
    setState(() {
      _initialTemp = temp;
      _isLoading = false;
    });
    _controller.startUpdatingTemperature();
  }

  Future<void> _calculateAverage() async {
    final avg = await _controller.calculateAverageTemperature();
    setState(() {
      _averageTemp = avg;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Previsão de Temperatura')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text('Temperatura inicial: ${_initialTemp!.value}°C', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  StreamBuilder<TemperatureModel>(
                    stream: _controller.temperatureStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text("Aguardando atualização...");
                      return Text(
                        'Temperatura Atual: ${snapshot.data!.value}°C',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _calculateAverage,
                    child: const Text("Calcular média (últimos 10)"),
                  ),
                  const SizedBox(height: 10),
                  if (_averageTemp != null)
                    Text('Média calculada: $_averageTemp°C', style: const TextStyle(fontSize: 16)),
                ],
              ),
      ),
    );
  }
}
