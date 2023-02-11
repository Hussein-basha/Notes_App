import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBarEditNote extends StatelessWidget {
  const CustomAppBarEditNote(
      {Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);

  final void Function()? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
