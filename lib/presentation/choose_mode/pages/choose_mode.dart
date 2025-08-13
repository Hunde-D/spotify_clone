
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/primary_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 60.0),
            decoration: BoxDecoration(
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
                            // Handle light mode selection
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle
                            ),
                            child: Icon(
                              Hicons.moonLightOutline, color: Colors.white, semanticLabel: 'Dark Mode', size: 36,),
                          ),
                        ),
                        Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 12.0,
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle light mode selection
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle
                            ),
                            child: Icon(Hicons.sun1Bold, color: Colors.white, semanticLabel: 'Light Mode', size: 36,),
                          ),
                        ),
                        Text(
                          'Light Mode',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(),
                PrimaryButton(onPressed: () {}, title: 'Continue', height: 92,),
              ],
            ),
          ),

          Container(color: Colors.black.withValues(alpha: 0.15)),
        ],
      ),
    );
  }
}