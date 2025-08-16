import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/primary_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20.0,
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  'Enjoy Listening To Music',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 17.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
                PrimaryButton(onPressed: () => Navigator.pushNamed(context, '/choose_mode'), title: 'Get Started'),
              ],
            ),
          ),

          IgnorePointer(
            ignoring: true,
            child: Container(color: Colors.black.withValues(alpha: 0.15))),
        ],
      ),
    );
  }
}
