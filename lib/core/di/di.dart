import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kontrol_app/core/di/di_providers.dart';
import 'package:kontrol_app/core/di/di_repositories.dart';
import 'package:kontrol_app/core/di/di_services.dart';
import 'package:kontrol_app/core/network/dio_client.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDi() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerLazySingleton(() => TokenStorage(prefs));

  getIt.registerLazySingleton<DioClient>(
    () => DioClient(
      baseUrl: dotenv.env['BASE_URL']!,
    ),
  );

  diProviders();
  diRepositories();
  diServices();
}
