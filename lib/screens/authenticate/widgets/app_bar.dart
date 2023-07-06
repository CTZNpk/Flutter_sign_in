import 'package:flutter/material.dart';

class MyAuthenticateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const MyAuthenticateAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      elevation: 0.0,
      actions: actions,
      toolbarOpacity: 1.0,
    );
  }
}
