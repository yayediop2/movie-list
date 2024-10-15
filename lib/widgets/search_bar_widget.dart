import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onTextChanged;
  const SearchBarWidget({super.key,required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 200,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
          onChanged: (text) {
            onTextChanged(text);
          },
        ),
      ),
    );
  }
}
