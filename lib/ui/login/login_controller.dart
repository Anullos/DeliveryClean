import 'package:delivery_thema/domain/exception/auth_exception.dart';
import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/domain/request/login_request.dart';
import 'package:flutter/material.dart';

enum LoginState {
  loading,
  initial,
}

class LoginController extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController({this.localRepositoryInterface, this.apiRepositoryInterface});

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial;

  Future<bool> signIn() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await apiRepositoryInterface.signIn(
        LoginRequest(username, password),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      loginState = LoginState.initial;
      notifyListeners();
      return true;
    } on AuthException catch (_) {
      loginState = LoginState.initial;
      notifyListeners();
      return false;
    }
  }
}
