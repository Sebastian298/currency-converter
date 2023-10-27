import 'package:conversor_monedas/data/country_flags.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatelessWidget {
  final String? dropdownValue;
  final Widget? icon;
  final List<String> itemsOptions;
  void Function(String?) onChanged;
  CustomDropdownButton({
    super.key,
    this.dropdownValue,
    this.icon,
    required this.onChanged,
    required this.itemsOptions,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: itemsOptions.map((items) {
        return DropdownMenuItem(
          value: items,
          child: Row(
            children: [
              Image.asset(countryFlags[items].toString()),
              Text(items),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
      value: dropdownValue,
    );
  }
}
