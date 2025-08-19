import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/custom_app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/home/widgets/new_songs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'News'),
    Tab(text: 'Video'),
    Tab(text: 'Artist'),
    Tab(text: 'Podcast'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  CustomAppBar(
                    title: SvgPicture.asset(AppVectors.logo, height: 40),
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(AppVectors.topPattern),
                        ),
                        Positioned(
                          top: -63,
                          right: 0,
                          child: Image.asset(
                            AppImages.newAlbumArtist,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'New Album ',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                      fontSize: 11,
                                    ),
                              ),
                              Text(
                                'Happier Than\nEver',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                              Text(
                                'Billie Eilish',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                      fontSize: 13,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //=== Tabs ===
            TabBar(
              tabs: myTabs,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding: const EdgeInsets.fromLTRB(12, 20, 0, 20),
              labelColor: context.isDarkMode ? Color(0xffDBDBDB) : Colors.black,
              unselectedLabelColor: Theme.of(
                context,
              ).textTheme.labelMedium!.color,
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 0,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                borderSide: BorderSide(
                  width: 3.0,
                  color: Theme.of(context).primaryColor,
                ),
                insets: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
              indicatorPadding: EdgeInsets.symmetric(vertical: 4),
              indicatorAnimation: TabIndicatorAnimation.elastic,
              dividerColor: Colors.transparent,
            ),
            SizedBox(
              height: 300,
              child: TabBarView(
                children:[
                  const NewSongs(),
                Center(child: Text('Page 2')),
                Center(child: Text('Page 3')),
                Center(child: Text('Page 4')),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}