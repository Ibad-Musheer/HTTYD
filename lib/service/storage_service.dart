import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const storage = FlutterSecureStorage();

  // keys
  static const _authToken = "authToken";
  static const _rememberMe = "rememberMe";
  static const _checkLocalAuth = "checkLocalAuth";

  static Future<String> getAuthToken() async {
    return await storage.read(key: _authToken) ?? "";
  }

  static Future<void> setAuthToken(String authtoken) async {
    await storage.write(key: _authToken, value: authtoken);
  }

  static Future<void> setRememberMe(String rememberMe) async {
    await storage.write(key: _rememberMe, value: rememberMe);
  }

  static Future<String> getRememberMe() async {
    return await storage.read(key: _rememberMe) ?? "";
  }

  static Future<void> setLocalAuth(String checkLocalAuth) async {
    await storage.write(key: _checkLocalAuth, value: checkLocalAuth);
  }

  static Future<String> getLocalAuth() async {
    return await storage.read(key: _checkLocalAuth) ?? "";
  }

  static Future<void> deleteAuthUser() async {
    await storage.delete(key: _authToken);
    await storage.delete(key: _rememberMe);
  }

  static Future<void> clearAll() async {
    await storage.deleteAll();
  }

  // static Future<String> getUserId() async {
  //   String userId = await storage.read(key: _userId) ?? "";
  //   return userId;
  // }

  // static Future<String> getUserLevel() async {
  //   String userLevel = await storage.read(key: _userLevel) ?? "";
  //   return userLevel;
  // }

  // static Future<void> setUserId(String userId) async {
  //   await storage.write(key: _userId, value: userId);
  // }

  // static Future<void> setUserLevel(String userLevel) async {
  //   await storage.write(key: _userLevel, value: userLevel);
  // }

  // static Future<void> setThemePrimaryColor(Color primaryColor) async {
  //   String colorString = primaryColor.value.toRadixString(16);
  //   await storage.write(key: _primaryColor, value: colorString);
  // }

  // static Future<Color?> getThemePrimaryColor() async {
  //   String? colorString = await storage.read(key: _primaryColor);
  //   if (colorString != null && colorString.isNotEmpty) {
  //     return Color(int.parse(colorString, radix: 16));
  //   }
  //   return CustomColors.primary;
  // }

  // static Future<void> setThemeTextColor(Color primaryColor) async {
  //   await storage.write(key: _textColor, value: jsonEncode(primaryColor));
  // }

  // static Future<Object> getThemeTextColor() async {
  //   return await (storage.read(key: _textColor)) ?? CustomColors.primary;
  // }

  // static Future<void> setAppLogo(String appLogo) async {
  //   await storage.write(key: _appLogo, value: appLogo);
  // }

  // static Future<String?> getAppLogo() async {
  //   return (storage.read(key: _appLogo));
  // }
}
