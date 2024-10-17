import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onTextChanged;
  const SearchBarWidget({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 140,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            focusColor: Colors.green,
            fillColor: Colors.white,
          ),
          onChanged: (text) {
            onTextChanged(text);
          },
        ),
      ),
    );
  }
}
