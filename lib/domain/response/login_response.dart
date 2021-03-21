import 'package:delivery_thema/domain/models/user.dart';

class LoginResponse {
  final String token;
  final User user;

  LoginResponse(this.token, this.user);
}
