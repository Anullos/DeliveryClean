import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;

  ThemeProvider(this.localRepositoryInterface);

  ThemeData currentTheme;

  void loadTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark == null) {
      updateTheme(darkTheme);
    } else {
      updateTheme(isDark ? darkTheme : lightTheme);
    }
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
