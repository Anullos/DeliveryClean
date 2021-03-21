import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController(
      {this.localRepositoryInterface, this.apiRepositoryInterface});

  // valida el theme
  // void validateTheme() async {
  //   final isDark = await localRepositoryInterface.isDarkMode();
  //   if (isDark != null) {
  //   } else {}
  // }

  // valida si hay usuario
  Future<bool> validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      // pantalla home
      return true;
    } else {
      // pantalla login
      return false;
    }
  }
}
