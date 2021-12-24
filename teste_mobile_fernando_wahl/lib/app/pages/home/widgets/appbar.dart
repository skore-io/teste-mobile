import 'package:flutter/material.dart';
import 'package:teste_mobile_fernando_wahl/app/core/utils/hexcolor.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final Function()? onPressed;

  HomeAppBar({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor("4F4F4F"),
      elevation: 1,
      leading: Icon(Icons.menu, color: Colors.white),
      centerTitle: true,
      title: const Text(
        "Lista de Classes",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.autorenew_outlined),
          color: Colors.white,
          disabledColor: HexColor("DADADA"),
          onPressed: onPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
