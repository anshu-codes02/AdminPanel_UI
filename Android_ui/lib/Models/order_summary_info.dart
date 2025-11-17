
import 'dart:ui';

import 'package:flutter/material.dart';

class orderSummaryInfo {

   final String?  title;
  final int? ordersCount;
  final double? percentage;
  final Color? color=const Color.fromARGB(255, 230, 105, 3);

  orderSummaryInfo({
   required this.title,
    required this.ordersCount,
    required this.percentage,
  });
}