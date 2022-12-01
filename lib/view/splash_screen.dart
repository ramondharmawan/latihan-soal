import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soalatihan/constants/r.dart';
import 'package:soalatihan/view/login_page.dart';
import 'package:soalatihan/view/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // TODO redirect to register or home
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }
    });

    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(
          R.assets.icSplash,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
