import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';
import 'package:kontrol_app/data/service/common_service.dart';
import 'package:kontrol_app/domain/model/common_color.dart';
import 'package:kontrol_app/domain/model/common_icon.dart';
import 'package:kontrol_app/domain/repository/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonService _service;

  CommonRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<CommonColor>>> fetchCommonColors() async {
    try {
      final res = await _service.fetchCommonColors();
      if (res.statusCode == 200 && res.data != null) {
        return Right(res.data!.map((e) => e.toDomain()).toList());
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure("Failed to fetch common colors"));
    }
  }

  @override
  Future<Either<Failure, List<CommonIcon>>> fetchCommonIcons() async {
    try {
      final res = await _service.fetchCommonIcons();
      if (res.isSuccess()) {
        return Right(res.data!.map((e) => e.toDomain()).toList());
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure("Failed to fetch common colors"));
    }
  }
}
