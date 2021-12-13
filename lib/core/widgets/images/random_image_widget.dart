import 'package:flutter/material.dart';

class RandomImageWidget extends StatelessWidget {
  const RandomImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Image.network(
          'https://source.unsplash.com/random/800x500/?class',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const CircularProgressIndicator();
          },
          errorBuilder: (context, error, stackTrace) => const Text('Não conseguimos carregar a imagem ;('),
        ),
      );
}
