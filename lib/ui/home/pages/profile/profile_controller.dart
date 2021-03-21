import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  ProfileController(
      {this.apiRepositoryInterface, this.localRepositoryInterface});

  bool isDark = false;

  void loadTheme() async {
    isDark = await localRepositoryInterface.isDarkMode() ?? true;
    notifyListeners();
  }

  void updateTheme(bool isDarkValue) {
    localRepositoryInterface.saveDarkMode(isDarkValue);
    isDark = isDarkValue;
    notifyListeners();
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
