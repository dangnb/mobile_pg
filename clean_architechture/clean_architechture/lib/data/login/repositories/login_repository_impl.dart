import 'package:clean_architechture/data/login/data_sources/remote/login_api.dart';
import 'package:clean_architechture/data/login/models/request/login_request.dart';
import 'package:clean_architechture/data/login/models/response/login_response.dart';
import 'package:clean_architechture/domain/login/repositories/login_repository.dart';
import 'package:clean_architechture/utils/session_utils.dart';
import 'package:device_info/device_info.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<LoginResponse> login(LoginRequest request, String deviceId) async {
    try {
      final loginResponse = await api.login(request, deviceId);
      //await Future.delayed(const Duration(seconds: 3));
      return loginResponse;
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<bool> isLogin() async {
    var token = SessionUtils.getAccessToken();
    return token != null;
  }

  @override
  void signOut() {
    SessionUtils.remoteAccessToken();
  }
}
