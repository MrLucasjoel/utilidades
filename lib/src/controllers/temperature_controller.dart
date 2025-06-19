import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import '../models/temperature_model.dart';

class TemperatureController {
  final _temperatureStreamController = StreamController<TemperatureModel>.broadcast();
  Timer? _updateTimer;
  final List<TemperatureModel> _history = [];

  Stream<TemperatureModel> get temperatureStream => _temperatureStreamController.stream;

  /// Carrega temperatura inicial simulada com delay
  Future<TemperatureModel> fetchInitialTemperature() async {
    await Future.delayed(const Duration(seconds: 2));
    final temp = _generateTemperature();
    _history.add(temp);
    return temp;
  }

  /// Inicia Stream periódica a cada 2s com temperatura nova
  void startUpdatingTemperature() {
    _updateTimer?.cancel(); // previne múltiplas execuções
    _updateTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      final temp = _generateTemperature();
      _history.add(temp);
      if (_history.length > 10) _history.removeAt(0); // mantém só os últimos 10

      // Só adiciona se o stream ainda estiver aberto
      if (!_temperatureStreamController.isClosed) {
        _temperatureStreamController.add(temp);
      }
    });
  }

  /// Gera temperatura aleatória entre 20 e 35 graus
  TemperatureModel _generateTemperature() {
    final value = 20 + Random().nextDouble() * 15;
    return TemperatureModel(
      double.parse(value.toStringAsFixed(2)),
      DateTime.now(),
    );
  }

  /// Envia histórico ao Isolate para calcular a média
  Future<double> calculateAverageTemperature() async {
    if (_history.isEmpty) return 0.0;

    final receivePort = ReceivePort();
    await Isolate.spawn(_isolateEntry, [receivePort.sendPort, List<TemperatureModel>.from(_history)]);
    return await receivePort.first as double;
  }

  /// Função do Isolate (executa fora da UI)
  static void _isolateEntry(List<dynamic> args) {
    SendPort sendPort = args[0];
    List<TemperatureModel> temps = args[1];

    double avg = temps.map((t) => t.value).reduce((a, b) => a + b) / temps.length;
    sendPort.send(double.parse(avg.toStringAsFixed(2)));
  }

  /// Libera recursos
  void dispose() {
    _updateTimer?.cancel();
    _temperatureStreamController.close();
  }
}
