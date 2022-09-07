// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/Store.dart';
import 'package:flutter_application_1/pages/begin-page.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/utils/routs.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mytheme.lightheme(context),
      darkTheme: Mytheme.darktheme(context),
      initialRoute: Myrouts.homeRoute,
      routes: {
        "/": (context) => Loginpage(),
        Myrouts.homeRoute: (context) => Homepage(),
        Myrouts.loginRoute: (context) => Loginpage(),
        Myrouts.cartlRoute: (context) => Cartpage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
