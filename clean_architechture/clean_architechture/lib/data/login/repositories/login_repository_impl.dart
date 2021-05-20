import 'package:clean_architechture/data/login/data_sources/remote/login_api.dart';
import 'package:clean_architechture/data/login/models/request/login_request.dart';
import 'package:clean_architechture/data/login/models/response/login_response.dart';
import 'package:clean_architechture/domain/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      var deviceId='157a46fe1c03c03d';
      final loginResponse = await api.login(request,deviceId);
      //await Future.delayed(const Duration(seconds: 3));
      return loginResponse;
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  bool isLogin() {
    // TODO: implement isLogin
    throw UnimplementedError();
  }

  @override
  void signOut() {
    // TODO: implement signOut
  }
}
