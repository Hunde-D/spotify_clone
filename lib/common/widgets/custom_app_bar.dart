import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.leading, this.actions});

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading:
          leading ??
          IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: 0.03)
                : Colors.black.withValues(alpha: 0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(CupertinoIcons.chevron_back),
        ),
      ),
      actions: actions,
    );
  }
}
