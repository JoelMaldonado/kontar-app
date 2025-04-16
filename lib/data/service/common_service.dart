import 'package:kontar/core/network/dio_client.dart';
import 'package:kontar/data/model/dto/common_color_dto.dart';
import 'package:kontar/data/model/dto/common_icon_dto.dart';
import 'package:kontar/data/model/response/api_response.dart';

class CommonService {
  final DioClient _dioClient;

  CommonService(this._dioClient);

  Future<ApiResponse<List<CommonColorDto>>> fetchCommonColors() async {
    final call = await _dioClient.get('/common/colors');

    final response = ApiResponse<List<CommonColorDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => CommonColorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse<List<CommonIconDto>>> fetchCommonIcons() async {
    final call = await _dioClient.get('/common/icons');

    final response = ApiResponse<List<CommonIconDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => CommonIconDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }
}
