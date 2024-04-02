import 'package:flutter/material.dart';
import 'package:block_part1/screens/new_user/first_check_screen.dart';
import 'package:block_part1/screens/old_users/check_screen.dart';
import '../../data/local/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StorageRepository.getBool(key: "isOld")
              ? const CheckOldScreen()
              : const FirstCheckScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash.png",
          width: 200,
        ),
      ),
    );
  }
}
