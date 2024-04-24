import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixseeker/controller/images.dart';

class ImageLoadingOrErrorWidget extends StatelessWidget {
  const ImageLoadingOrErrorWidget({
    super.key,
    required this.controller,
  });

  final PixabayController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.searchQuery.isEmpty
          ? const CircularProgressIndicator()
          : Text(
              'Images related to ${controller.searchQuery} Not found',
            ),
    );
  }
}