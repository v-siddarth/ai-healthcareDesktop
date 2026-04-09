import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(child: Text("This screen falls from the top!")),
    );
  }
}

PageRouteBuilder _createFallingPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1), // Starts from the top
          end: const Offset(0, 0), // Ends at the normal position
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut, // Smooth falling effect
        )),
        child: child,
      );
    },
  );
}
