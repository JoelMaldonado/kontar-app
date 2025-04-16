import 'package:kontar/core/network/dio_client.dart';
import 'package:kontar/data/model/request/login_request.dart';
import 'package:kontar/data/model/response/api_response.dart';
import 'package:kontar/data/model/response/auth_response.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<ApiResponse<AuthResponse>> login(
    LoginRequest request,
  ) async {
    final call = await _dioClient.post(
      path: '/auth/login',
      data: request.toJson(),
    );

    final response = ApiResponse<AuthResponse>.fromJson(
      call.data,
      (json) => AuthResponse.fromJson(json as Map<String, dynamic>),
    );

    return response;
  }
}
