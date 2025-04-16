import 'package:flutter/material.dart';
import 'package:kontrol_app/app.dart';
import 'package:kontrol_app/app_providers.dart';
import 'package:kontrol_app/core/di/di.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupDi();
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}
