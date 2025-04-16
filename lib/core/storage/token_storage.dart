import 'package:kontar/data/model/response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  final SharedPreferences _prefs;

  TokenStorage(this._prefs);

  Future<void> saveTokens(AuthResponse response) async {
    await _prefs.setString(_keyAccessToken, response.accessToken);
    await _prefs.setString(_keyRefreshToken, response.refreshToken);
  }

  String? getAccessToken() {
    return _prefs.getString(_keyAccessToken);
  }

  String? getRefreshToken() {
    return _prefs.getString(_keyRefreshToken);
  }

  Future<void> clearAccessToken() async {
    await _prefs.remove(_keyAccessToken);
  }

  Future<void> clearRefreshToken() async {
    await _prefs.remove(_keyRefreshToken);
  }
}
