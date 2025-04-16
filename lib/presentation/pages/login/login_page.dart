import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';
import 'package:kontrol_app/presentation/pages/login/login_provider.dart';
import 'package:kontrol_app/presentation/widgets/app_button.dart';
import 'package:kontrol_app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    provider.onSuccess = () {
      GoRouter.of(context).go(AppPaths.menu);
    };
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            AppTextField(
              label: "Username",
              hint: "Enter your username",
              controller: provider.usernameController,
            ),
            AppTextField(
              label: "Password",
              hint: "Enter your password",
              controller: provider.passwordController,
            ),
            AppButton(
              text: "Login",
              onPressed: provider.login,
              isLoading: provider.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
