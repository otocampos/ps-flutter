import 'dart:ui';

import 'package:flutter/material.dart';

class EntregaudiumTypography {
  static TextStyle title() {
    return const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.normal,
      fontSize: 24,
      color: Colors.white,
    );
  }

  static TextStyle subTitle() {
    return const TextStyle(
      fontFamily: 'OpenSansLight',
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Color(0xFFDFE9F7),
    );
  }

  static TextStyle desc() {
    return const TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.normal,
      fontSize: 15,
      height: 2,
      color: Color(0xFFECF4FF),
    );
  }

  static TextStyle numberIndicator() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: Colors.white,
    );
  }

  static TextStyle nameIndicator() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 13,
      color: Color(0xFFECF4FF),
    );
  }
}
