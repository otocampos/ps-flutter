import 'package:entregaudium/core/utils/entregaudium_typography.dart';
import 'package:flutter/material.dart';

class StatsProfileRowWidget extends StatelessWidget {
  String image;
  String value;
  String desc;

  StatsProfileRowWidget({required this.image,
    required this.value,
    required this.desc,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Image.asset(image),
            Text(
              value,
              style: EntregaudiumTypography.numberIndicator(),
            ),
            Text(
              desc,
              style: EntregaudiumTypography.nameIndicator(),
            )
          ],
        ));
  }
}