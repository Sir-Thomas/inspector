import 'package:flutter/material.dart';

class AutocompleteContainerWidget extends StatelessWidget {
  final Key? fieldKey;
  final String initialValue;
  final List<String> options;
  final ValueSetter<String> onSelected;

  const AutocompleteContainerWidget({
    super.key,
    this.fieldKey,
    required this.initialValue,
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
        initialValue: TextEditingValue(text: initialValue),
        key: fieldKey,
        optionsBuilder: (textEditingValue) {
          return options.where(
            (option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            },
          );
        },
        onSelected: onSelected,
      ),
    );
  }
}
