import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/auth_social_redirect.dart';
import 'package:spotify_clone/common/widgets/custom_app_bar.dart';
import 'package:spotify_clone/common/widgets/custom_password_field.dart';
import 'package:spotify_clone/common/widgets/custom_text_field.dart';
import 'package:spotify_clone/common/widgets/gradient_separator.dart';
import 'package:spotify_clone/common/widgets/primary_button.dart';
import 'package:spotify_clone/common/widgets/social_buttons.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/domain/usecases/signup_usecase.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(AppVectors.logo, height: 40),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              spacing: 12.0,
              children: [
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you need any support ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'click here',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xff38B432),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                spacing: 12.0,
                children: [
                  CustomTextField(
                    controller: _fullNameController,
                    hintText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomPasswordField(
                    controller: _passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  PrimaryButton(onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                        var result = await sl<SignupUseCase>().call(
                          params: CreateUserReq(
                            fullName: _fullNameController.text.toString(),
                            email: _emailController.text.toString(),
                            password: _passwordController.text.toString(),
                          ),
                        );
                        result.fold(
                          (failure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: ${failure.message}'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          (user) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Sign up successful!'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/root',
                              (route) => false,
                            );
                          },
                        );
                      }
                    },
                    title: 'Create Account',
                  ),
                ],
              ),
            ),
            GradientSeparator(
              colors: [const Color(0xFFB0B0B0), const Color(0xFFD3D3D3)],
              darkColors: [const Color(0xFF5B5B5B), const Color(0xFF252525)],
              text: 'Or',
            ),
            SocialButtons(),
            AuthSwitchText(
              mainText: "Do you have an account?",
              actionText: "Sign In",
              onTap: () => Navigator.pushNamed(context, '/auth/login'),
            ),
          ],
        ),
      ),
    );
  }
}
