import 'package:delivery_thema/domain/models/product.dart';
import 'package:delivery_thema/domain/models/user.dart';
import 'package:delivery_thema/domain/request/login_request.dart';
import 'package:delivery_thema/domain/response/login_response.dart';

abstract class ApiRepositoryInterface{
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> signIn(LoginRequest login);
  Future<void> logout (String token);
  Future<List<Product>> getProducts();
}