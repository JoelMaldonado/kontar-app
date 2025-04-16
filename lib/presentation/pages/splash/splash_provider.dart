import 'package:flutter/material.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';

class SplashProvider extends ChangeNotifier {
  final TokenStorage _tokenStorage;

  SplashProvider(this._tokenStorage);

  Function(String)? onSuccess;

  init() async {
    final token = _tokenStorage.getAccessToken();
    if (token == null) {
      onSuccess?.call(AppPaths.login);
    } else {
      onSuccess?.call(AppPaths.menu);
    }
  }
}
