import 'package:flutter/material.dart';

class AutocompleteContainerWidget extends StatelessWidget {
  final Key? fieldKey;
  final List<String> options;
  final ValueSetter<String> onSelected;

  const AutocompleteContainerWidget({
    super.key,
    this.fieldKey,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Autocomplete(
        key: fieldKey,
        optionsBuilder: (textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return options.where((option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: onSelected,
      ),
    );
  }
}
