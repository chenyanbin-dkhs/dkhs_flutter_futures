import 'package:flutter/material.dart';

class ConstantUtils {
  static const bool inProduction =
      const bool.fromEnvironment("dart.vm.product");

  static bool isTest = false;
  static const String COPY_RIGHT = 'Copyright © 2019 DKHS.All Rights Reserved';
}
