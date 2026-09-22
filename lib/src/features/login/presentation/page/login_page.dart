import 'package:flutter/material.dart';
import 'package:roadway/src/core/constants/constants.dart';
import 'package:roadway/src/core/constants/images.dart';
import 'package:roadway/src/core/constants/paddings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.marginContent,
        child: SafeArea(
          child: Form(
            child: Column(
              spacing: 10,
              mainAxisSize: .max,
              children: [
                Column(
                  mainAxisSize: .min,
                  children: [
                    SizedBox.square(
                      dimension: 120,
                      child: Image.asset(AppImages.icon.path),
                    ),
                    Text(AppConstants.appName),
                  ],
                ),
                TextFormField(
                  keyboardType: .emailAddress,
                  autofillHints: [AutofillHints.email],
                  textInputAction: .next,
                  validator: (value) {
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
