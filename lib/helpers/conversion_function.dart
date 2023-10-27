import 'package:conversor_monedas/data/tipos_cambio.dart';

class ConversionFunction {
  double convertCurrency(
      double cantidad, String monedaOrigen, String monedaDestino) {
    final tasaDeCambio = tasasDeCambio[monedaOrigen]![monedaDestino]!;
    return double.parse((cantidad * tasaDeCambio).toStringAsFixed(3));
  }
}
