import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';
import 'package:kontrol_app/data/model/request/login_request.dart';
import 'package:kontrol_app/data/service/auth_service.dart';
import 'package:kontrol_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final TokenStorage _tokenStorage;

  AuthRepositoryImpl(
    this._authService,
    this._tokenStorage,
  );

  @override
  Future<Either<Failure, Unit>> login(String username, String password) async {
    try {
      final request = LoginRequest(
        username: username,
        password: password,
      );
      final res = await _authService.login(request);
      if (res.statusCode == 200 && res.data != null) {
        await _tokenStorage.saveTokens(res.data!);
        return Right(unit);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure("Login failed"));
    }
  }
}
