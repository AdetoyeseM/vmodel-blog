import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/service_locator.dart';
import 'package:vmodel_blog_app/ui/homepae/homepage.dart';
import 'package:vmodel_blog_app/ui/splash.dart';

void main() {
  initializesingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'VModel Blog App', 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: Color(0xffDBD7D1),
          seedColor: const Color(0xff503C3C)),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
