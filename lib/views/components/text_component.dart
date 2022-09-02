import 'package:flutter/material.dart';
import 'package:my_classes/theme/app_typography.dart';

class TextComponent extends StatelessWidget {
  final String title;
  final String? subtitle;

  const TextComponent({
    required this.title,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: listTitleStyle,
        ),
        Text(
          subtitle ?? '',
          style: listSubtitleStyle,
        ),
      ],
    );
  }
}
