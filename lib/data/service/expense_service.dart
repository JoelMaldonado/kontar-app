import 'package:kontar/core/network/dio_client.dart';
import 'package:kontar/data/model/dto/budget_dto.dart';
import 'package:kontar/data/model/dto/expense_category_dto.dart';
import 'package:kontar/data/model/dto/expense_dto.dart';
import 'package:kontar/data/model/request/category_request.dart';
import 'package:kontar/data/model/response/api_response.dart';

class ExpenseService {
  final DioClient _dioClient;

  ExpenseService(this._dioClient);

  Future<ApiResponse<dynamic>> createExpense({
    required double amount,
    required String description,
    required String photoUrl,
    required int idCategory,
  }) async {
    final call = await _dioClient.post(
      path: '/expense',
      data: {
        'amount': amount,
        'description': description,
        'photoUrl': photoUrl,
        'idCategory': idCategory,
      },
    );
    final response = ApiResponse.fromJson(
      call.data,
      (json) => null,
    );
    return response;
  }

  Future<ApiResponse<List<ExpenseDto>>> fetchExpenses() async {
    final call = await _dioClient.get('/expense');
    final response = ApiResponse.fromJson(
      call.data,
      (json) => (json as List).map((e) => ExpenseDto.fromJson(e)).toList(),
    );
    return response;
  }

  Future<ApiResponse<List<BudgetDto>>> fetchBudgets() async {
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

  Future<ApiResponse<dynamic>> createCategory(
    CreateCategoryRequest request,
  ) async {
    final call = await _dioClient.post(
      path: '/expense/category',
      data: request.toJson(),
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
