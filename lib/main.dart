import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soalatihan/view/login_page.dart';
import 'package:soalatihan/view/main/latihan_soal/mapel_page.dart';
import 'package:soalatihan/view/main/latihan_soal/paket_soal_page.dart';
import 'package:soalatihan/view/main_page.dart';
import 'package:soalatihan/view/register_page.dart';
import 'package:soalatihan/view/splash_screen.dart';

import 'constants/r.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // Replace with actual values , this below for web
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyAt_dya3m-eTQHvwPGr_-F1eLF52wPm01U",
      //   appId: "1:932789887897:web:71775d048a20c83ecfe908",
      //   messagingSenderId: "932789887897",
      //   projectId: "latihan-soal-1ece2",
      // ),
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Soal',
      theme: ThemeData(
        //dibawah ini penggunaan google fonts secara global dengan fonts tertentu eg. poppins
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.primary,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const SplashScreen(),
      initialRoute: "/",
      routes: {
        // "/": (context) => const SplashScreen(),
        // "/login": (context) => const LoginPage()
        "/": (context) => const SplashScreen(),
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        MainPage.route: (context) => const MainPage(),
        MapelPage.route: (context) => const MapelPage(),
        PaketSoalPage.route: (context) => const PaketSoalPage(),
      },
    );
  }
}
