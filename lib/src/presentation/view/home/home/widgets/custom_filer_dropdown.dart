import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;
  final String? selectedValue;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 39,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(33),
        ),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
        value: selectedValue,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
