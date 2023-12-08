import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Telefon qo\'ng\'iroq qilish uchun URL ochilmadi: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Telefon Qo\'ng\'iroq'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              makePhoneCall('944856603');
            },
            child: Text('Telefon qo\'ng\'iroq qilish'),
          ),
        ),
      ),
    );
  }
}