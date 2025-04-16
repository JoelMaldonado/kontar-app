import 'package:kontrol_app/core/network/dio_client.dart';
import 'package:kontrol_app/data/model/request/login_request.dart';
import 'package:kontrol_app/data/model/response/api_response.dart';
import 'package:kontrol_app/data/model/response/auth_response.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<ApiResponse<AuthResponse>> login(
    LoginRequest request,
  ) async {
    final call = await _dioClient.post(
      '/auth/login',
      data: request.toJson(),
    );

    final response = ApiResponse<AuthResponse>.fromJson(
      call.data,
      (json) => AuthResponse.fromJson(json as Map<String, dynamic>),
    );

    return response;
  }
}
