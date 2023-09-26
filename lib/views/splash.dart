import 'package:flutter/material.dart';
import 'package:quiz_app_project/views/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashTime();
    super.initState();
  }

  Future<void> splashTime() async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        child: Image.asset(
          'assets/image/Android Large - 10.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
