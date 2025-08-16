import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/custom_app_bar.dart';
import 'package:spotify_clone/common/widgets/primary_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const CustomAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(height: 15),
                Text(
                  'Enjoy Listening To Music',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/auth/register'),
                        title: 'Register',
                        height: 73,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () =>  Navigator.pushNamed(context, '/auth/login'),
                        child: Text('Sign in', style: Theme.of(context).textTheme.labelLarge,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
