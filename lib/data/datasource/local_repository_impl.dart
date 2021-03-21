import 'package:delivery_thema/domain/models/user.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';
const _pref_darkMode = 'DARKMODE';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(_pref_token);
  }

  @override
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_pref_username);
    final name = sharedPreferences.getString(_pref_name);
    final image = sharedPreferences.getString(_pref_image);
    final user = User(
      username: username,
      name: name,
      image: image,
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, user.username);
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);
    return user;
  }

  @override
  Future<bool> isDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_pref_darkMode);
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_pref_darkMode, darkMode);
  }
}
