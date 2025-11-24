import 'package:flutter/material.dart';
import 'package:sigmus/widgets/app_header.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool isOnline;

  const MainLayout({super.key, required this.child, this.isOnline = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(isOnline: isOnline),
      body: child,
    );
  }
}
