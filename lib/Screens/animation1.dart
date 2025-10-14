import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animation/Loading bar.json'),
      ),
    );
  }
}