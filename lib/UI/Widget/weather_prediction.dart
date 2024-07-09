import 'package:flutter/material.dart';

class WeatherPrediction extends StatelessWidget {
  const WeatherPrediction({
    super.key,
    required this.lowestTemp,
    required this.highestTemp,
  });

  final double lowestTemp, highestTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$lowestTemp\u00B0',
          style: const TextStyle(fontSize: 14),
        ),
        const Text(
          'Low',
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 25),
        Text(
          '$highestTemp\u00B0',
          style: const TextStyle(fontSize: 14),
        ),
        const Text(
          'High',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
