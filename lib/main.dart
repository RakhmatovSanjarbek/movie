import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/di.dart';
import 'package:movie/pages/splash_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('uz', 'UZ'),
          Locale('ru', 'RU'),
          Locale('en', 'EN'),
        ],
        path: 'assets/translation',
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(), // Replace with your home page widget
      ),
    );
  }
}
