import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<Locale> getDeviceLocale() async {
  // Your code to get the device locale asynchronously
  // For example, using the flutter_localizations package:
  final locale = await WidgetsBinding.instance!.window.locale;
  return locale;
}
