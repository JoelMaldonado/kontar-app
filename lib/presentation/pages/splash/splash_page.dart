import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontrol_app/presentation/pages/splash/splash_provider.dart';
import 'package:kontrol_app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context);
    provider.onSuccess = (route) => GoRouter.of(context).go(route);
    return AppScaffold(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
