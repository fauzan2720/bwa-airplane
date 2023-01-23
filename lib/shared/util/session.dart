import 'package:hive/hive.dart';

late Box mainStorage;

class SessionManager {
  bool isLogin = mainStorage.get("isLoggedIn") ?? false;

  saveLogin() {
    mainStorage.put("isLoggedIn", true);
  }
}
