import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.isIcon})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: secondaryBackgroundColor, fontWeight: FontWeight.normal),
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back,
          color: secondaryBackgroundColor,
        ),
      ),
      actions: [
        isIcon
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: secondaryBackgroundColor,
                ),
              )
            : Text(''),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
