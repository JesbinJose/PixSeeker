
import 'package:flutter/material.dart';
import 'package:pixseeker/controller/images.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.controller,
  });

  final PixabayController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: TextEditingController(
          text: controller.searchQuery.value,
        ),
        decoration: const InputDecoration(
          hintText: 'Search Images',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (String query) =>
            controller.searchQuery.value = query,
        onChanged: (value) => controller.searchQuery.value =
            value, // Update search query on change
      ),
    );
  }
}
