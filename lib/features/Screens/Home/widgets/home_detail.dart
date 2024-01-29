import 'package:evcar/constants/colors.dart';
import 'package:flutter/material.dart';

class TempVoltageCard extends StatelessWidget {
  final String label;
  final double value;
  final String unit;

  const TempVoltageCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tDarkColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: tPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "${value * 1} $unit",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
