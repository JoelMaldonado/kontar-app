import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kontar/domain/repository/auth_repository.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginProvider(
    this._authRepository,
  );

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
  }

  Function? onSuccess;

  Future<void> login() async {
    setLoading(true);
    final result = await _authRepository.login(
      usernameController.text,
      passwordController.text,
    );
    result.fold(
      (failure) => Fluttertoast.showToast(msg: failure.message),
      (success) => onSuccess?.call(),
    );
    setLoading(false);
  }
}
