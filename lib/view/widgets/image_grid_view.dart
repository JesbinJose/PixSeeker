import 'package:flutter/material.dart';
import 'package:pixseeker/controller/images.dart';
import 'package:pixseeker/view/widgets/single_image_tile.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({
    super.key,
    required this.controller,
  });

  final PixabayController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      controller: ScrollController(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: controller.images.length + 1,
      itemBuilder: (context, index) {
        if (index == controller.images.length) {
          if (controller.images.length % 30 == 0 &&
              controller.images.isNotEmpty) {
            controller.loadImage();
          }
          return const SizedBox.shrink();
        }
        final image = controller.images[index];
        return SingleImageTile(
            controller: controller, image: image);
      },
    );
  }
}
