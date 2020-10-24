import 'package:flutter/material.dart';
import 'package:skoreio/core/styles/appcolors.style.dart';
import 'package:skoreio/core/styles/appstyles.style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onRefreshPressed;

  const HomeAppBar({
    Key key,
    this.onRefreshPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      leading: Icon(Icons.menu, color: Colors.white),
      centerTitle: true,
      title: Text(
        "Classes",
        style: AppStyles.head2.copyWith(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          disabledColor: AppColors.DISABLED,
          onPressed: onRefreshPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
