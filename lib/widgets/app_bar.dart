import 'package:flutter/material.dart';
import '../constants.dart';

PreferredSizeWidget? appBar() {
  return AppBar(
      centerTitle: true,
      title: const Text(appTitle, style: TextStyle(color: darkSlateBlue)),
      iconTheme: const IconThemeData(color: englishViolet));
}
