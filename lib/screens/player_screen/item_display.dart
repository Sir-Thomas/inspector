import 'package:flutter/material.dart';
import 'package:inspector/models/item.dart';

class ItemDisplay extends StatelessWidget {
  final Item? item;

  const ItemDisplay({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const SizedBox(
        height: 40,
        width: 40,
      );
    }
    return SizedBox(
      height: 40,
      width: 40,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Image.network(_formatItemURL(item!.imageURL)),
      ),
    );
  }
}

String _formatItemURL(String imageID) {
  print(imageID);
  return 'https://api.maplestory.net/item/${imageID}/icon';
}
