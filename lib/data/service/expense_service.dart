import 'package:kontrol_app/core/network/dio_client.dart';
import 'package:kontrol_app/data/model/dto/budget_dto.dart';
import 'package:kontrol_app/data/model/dto/expense_category_dto.dart';
import 'package:kontrol_app/data/model/response/api_response.dart';

class ExpenseService {
  final DioClient _dioClient;

  ExpenseService(this._dioClient);

  Future<ApiResponse<List<BudgetDto>>> allBudgets() async {
    final call = await _dioClient.get('/expense/budget');
    final response = ApiResponse.fromJson(
      call.data,
      (json) => (json as List).map((e) => BudgetDto.fromJson(e)).toList(),
    );
    return response;
  }

  Future<ApiResponse<List<ExpenseCategoryDto>>> fetchCategories() async {
    final call = await _dioClient.get('/expense/category');
    final response = ApiResponse.fromJson(
      call.data,
      (json) =>
          (json as List).map((e) => ExpenseCategoryDto.fromJson(e)).toList(),
    );
    return response;
  }

  Future<ApiResponse<dynamic>> createCategory({
    required String name,
    required int idIcon,
    required int idColor,
  }) async {
    final call = await _dioClient.post(
      '/expense/category',
      data: {
        'name': name,
        'idIcon': idIcon,
        'idColor': idColor,
      },
    );
    final response = ApiResponse.fromJson(
      call.data,
      (json) => null,
    );
    return response;
  }

  Future<ApiResponse<dynamic>> deleteCategory(int id) async {
    final call = await _dioClient.delete('/expense/category/$id');
    final response = ApiResponse.fromJson(
      call.data,
      (json) => null,
    );
    return response;
  }
}
