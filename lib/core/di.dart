import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/data_repository.dart';
import 'package:movie/data/firebase_helper.dart';

import '../data/flutter_localizations.dart';

final di = GetIt.instance;

Future setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  final easyLocalizationController = EasyLocalizationController();
  await easyLocalizationController.initializeDeviceLocale();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  di.registerLazySingleton(() => FirebaseHelper());
  di.registerLazySingleton(() => DataRepository());
}

class EasyLocalizationController {
  late Locale _deviceLocale;

  Locale get deviceLocale => _deviceLocale;

  Future<void> initializeDeviceLocale() async {
    _deviceLocale = await getDeviceLocale();
  }
}