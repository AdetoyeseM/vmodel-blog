import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/ui/homepae/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      return Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const HomePage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xffDBD7D1),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset("assets/images/logo.png",),
      )),
    );
  }
}
