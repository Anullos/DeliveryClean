import 'package:delivery_thema/domain/models/user.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<void> saveToken(String token);
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<void> saveDarkMode(bool darkMode);
  Future<bool> isDarkMode();
}
