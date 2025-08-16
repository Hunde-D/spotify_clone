import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/primary_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 60.0),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 36.0,
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      spacing: 12.0,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ThemeCubit>().toggleTheme(
                              ThemeMode.dark,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Hicons.moonLightOutline,
                              color: Colors.white,
                              semanticLabel: 'Dark Mode',
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 17.0,
                                color: Color(0xffDADADA),
                              ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 12.0,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ThemeCubit>().toggleTheme(
                              ThemeMode.light,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Hicons.sun1Bold,
                              color: Colors.white,
                              semanticLabel: 'Light Mode',
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Light Mode',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 17.0,
                                color: Color(0xffDADADA),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
                PrimaryButton(
                  onPressed: () => Navigator.pushNamed(context, '/auth'),
                  title: 'Continue',
                  height: 92,
                ),
              ],
            ),
          ),

          IgnorePointer(
            ignoring: true,
            child: Container(color: Colors.black.withValues(alpha: 0.15)),
          ),
        ],
      ),
    );
  }
}
