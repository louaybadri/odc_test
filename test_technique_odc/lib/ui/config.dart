
import 'package:flutter/material.dart';

extension Config on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height-MediaQuery.of(this).padding.top;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get fullHeight => MediaQuery.of(this).size.height;
}