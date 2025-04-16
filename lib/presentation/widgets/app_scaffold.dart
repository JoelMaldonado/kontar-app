import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final FloatingActionButton? floatingActionButton;
  final Widget child;

  const AppScaffold({
    super.key,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
