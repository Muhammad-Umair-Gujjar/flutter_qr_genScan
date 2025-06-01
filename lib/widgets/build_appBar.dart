import 'package:flutter/material.dart';

class BuildAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color bgAppBarColor;
  final bool backArrow;
  final Color textColor;
  final double textSize;

  const BuildAppbar({
    super.key,
    required this.text,
    this.bgAppBarColor = Colors.black,
    this.textColor = Colors.white,
    this.textSize = 18,
    this.backArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backArrow,
      backgroundColor: bgAppBarColor,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
