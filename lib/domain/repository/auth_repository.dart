import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(String username, String password);
}
