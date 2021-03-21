import 'package:delivery_thema/data/productos.dart';
import 'package:delivery_thema/domain/exception/auth_exception.dart';
import 'package:delivery_thema/domain/models/product.dart';
import 'package:delivery_thema/domain/models/user.dart';
import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/response/login_response.dart';
import 'package:delivery_thema/domain/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    if (token == 'AA111') {
      return User(
          name: 'Daniel',
          username: 'Anullos',
          image: 'assets/logo/logo_anullos.png');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> signIn(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 2));
    if (login.username == 'Anullos' && login.password == '1234') {
      return LoginResponse(
          'AA111',
          User(
              name: 'Daniel',
              username: 'Anullos',
              image: 'assets/logo/logo_anullos.png'));
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('borrando token del server');
  }

  @override
  Future<List<Product>> getProducts() async{
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
