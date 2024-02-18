import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/service_locator.dart'; 
import 'package:vmodel_blog_app/ui/splash.dart';
import 'package:vmodel_blog_app/ui/utilities/network_check.dart';

void main() {
  initializesingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrected the key syntax
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'VModel Blog App', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: const Color(0xffDBD7D1),
          seedColor: const Color(0xff503C3C)),
        useMaterial3: true,
      ),
      home: const NetworkSensitiveWidget(child: Splash()), // Wrap Splash with NetworkSensitiveWidget
    );
  }
}
