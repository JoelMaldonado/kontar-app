import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';
import 'package:kontrol_app/domain/model/common_color.dart';
import 'package:kontrol_app/domain/model/common_icon.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<CommonColor>>> fetchCommonColors();
  Future<Either<Failure, List<CommonIcon>>> fetchCommonIcons();
}
