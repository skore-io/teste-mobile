import 'package:flutter/material.dart';
import 'package:skore_mobile_challenge/presentation/widgets/removal_button/removal_button_theme.dart';

class RemovalButton extends StatelessWidget {
  final VoidCallback? onPress;

  const RemovalButton({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RemovalButtonTheme removalButtonTheme = Theme.of(context).extension<RemovalButtonTheme>()!;

    return IconButton(
      iconSize: 24,
      onPressed: onPress,
      color: removalButtonTheme.iconColor,
      splashColor: removalButtonTheme.iconColor,
      icon: const Icon(Icons.close),
    );
  }
}
