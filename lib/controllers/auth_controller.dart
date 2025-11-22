class AuthController {
  static bool isLoggedIn = false;

  // Kredensial disembunyikan agar tidak diakses sembarangan
  static const String _username = "admin";
  static const String _password = "admin";

  static bool login(String username, String password) {
    if (username == _username && password == _password) {
      isLoggedIn = true;
      return true;
    }
    return false;
  }

  static void logout() {
    isLoggedIn = false;
  }
}
