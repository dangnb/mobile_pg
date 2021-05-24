import 'package:clean_architechture/data/login/models/request/login_request.dart';
import 'package:clean_architechture/data/login/models/response/login_response.dart';
import 'package:clean_architechture/domain/login/entities/user_entitiy.dart';
import 'package:clean_architechture/domain/login/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<LoginResponse> login(LoginRequest request,String deviceID) => _repository.login(request,deviceID);

  Future<bool> isLogin()=>_repository.isLogin();
  void signOut()=>_repository.signOut();
}
