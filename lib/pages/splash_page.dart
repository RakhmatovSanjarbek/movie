import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/pages/sign_up_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorToNextPage(context);
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splash.json'),
      ),
    );
  }

  void NavigatorToNextPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> SignUpPage()), (route) => false);
    },);
  }
}
