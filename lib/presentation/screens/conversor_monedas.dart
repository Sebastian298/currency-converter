import 'package:conversor_monedas/helpers/conversion_function.dart';
import 'package:conversor_monedas/widgets/custom_dropdown_button.dart';
import 'package:conversor_monedas/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';

class ConversorMonedas extends StatefulWidget {
  const ConversorMonedas({super.key});

  @override
  State<ConversorMonedas> createState() => _ConversorMonedasState();
}

class _ConversorMonedasState extends State<ConversorMonedas> {
  String dropdownValue1 = 'MXN';
  String dropdownValue2 = 'USD';
  final itemsConversor = ['MXN', 'USD', 'EUR'];
  String monedaOrigen = "";
  String monedaDestino = "";
  double cantidadDinero = 0;
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de monedas'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30.0),
                child: CustomDropdownButton(
                  dropdownValue: dropdownValue1,
                  itemsOptions: itemsConversor,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue1 = value ?? "";
                      monedaOrigen = dropdownValue1;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  setState(() {
                    cantidadDinero = double.tryParse(value.toString()) ?? 0;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.all(50.0),
                child: CustomDropdownButton(
                  dropdownValue: dropdownValue2,
                  itemsOptions: itemsConversor,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue2 = value ?? "";
                      monedaDestino = dropdownValue2;
                    });
                  },
                ),
              ),
              Text(
                '${total == 0 ? '-' : total}',
              ),
              const SizedBox(
                height: 35,
              ),
              CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    monedaOrigen = monedaOrigen == '' ? 'MXN' : monedaOrigen;
                    monedaDestino = monedaDestino == '' ? 'USD' : monedaDestino;
                    total = ConversionFunction().convertCurrency(
                        cantidadDinero, monedaOrigen, monedaDestino);
                  });
                },
                child: const Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
