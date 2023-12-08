import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/pages/main_pages/home_page.dart';
import 'package:movie/pages/sign_up_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigatorToNextPage(context);

    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splash.json'),
      ),
    );
  }

  void navigatorToNextPage(BuildContext context){
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) =>
              const SignUpPage()
          ),
              (route) => false);
    },);
  }

  // Future navigatorToNextPage(BuildContext context) async {
  //   bool isLogin = context.watch<AppProvider>().getIsLogin();
  //
  //   await Future.delayed(const Duration(seconds: 6), () {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) =>
  //            const SignUpPage()
  //         ),
  //             (route) => false);
  //   },);
  // }
}
