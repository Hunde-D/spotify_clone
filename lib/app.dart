import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/theme/app_theme.dart';
import 'package:spotify_clone/presentation/auth/pages/auth_page.dart';
import 'package:spotify_clone/presentation/auth/pages/signin_page.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_page.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify_clone/presentation/intro/pages/get_started.dart';
import 'package:spotify_clone/presentation/root/pages/root.dart';
import 'package:spotify_clone/presentation/splash/pages/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Spotify Clone',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashPage(),
              '/get_started': (context) => const GetStarted(),
              '/choose_mode': (context) => const ChooseMode(),
              '/auth': (context) => const AuthPage(),
              '/auth/register': (context) => const SignupPage(),
              '/auth/login': (context) => const SigninPage(),
              '/root': (context) => const RootPage(),
            },
          );
        },
      ),
    );
  }
}
