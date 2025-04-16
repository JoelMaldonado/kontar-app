import 'package:dartz/dartz.dart';
import 'package:kontar/core/errors/failure.dart';
import 'package:kontar/domain/model/common_color.dart';
import 'package:kontar/domain/model/common_icon.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<CommonColor>>> fetchCommonColors();
  Future<Either<Failure, List<CommonIcon>>> fetchCommonIcons();
}
