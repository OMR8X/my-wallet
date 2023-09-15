import 'package:flutter/material.dart';

void main() {
  runApp(const MyWallet());
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override 
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
