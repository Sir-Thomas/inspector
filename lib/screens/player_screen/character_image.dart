import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: image == null
          ? Image.memory(kTransparentImage)
          : Image.network(
              //placeholder: kTransparentImage,
              image!,
              //imageErrorBuilder: (context, error, stackTrace) =>
              //    Image.memory(kTransparentImage),
            ),
    );
  }
}
