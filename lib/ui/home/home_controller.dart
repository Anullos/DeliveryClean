import 'package:delivery_thema/domain/models/user.dart';
import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeController({this.localRepositoryInterface, this.apiRepositoryInterface});

  User user;
  int indexSelected = 0;

  void loadUser() async {
    user = await localRepositoryInterface.getUser();
    notifyListeners();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }
}
