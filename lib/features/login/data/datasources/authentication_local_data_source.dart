import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDataSource {
  final SharedPreferences preferences;

  AuthenticationLocalDataSource(this.preferences);

  final String _tokenKey = '__token__';

  Future<bool> storeToken(String token) async {
    return await preferences.setString(_tokenKey, token);
  }
}
