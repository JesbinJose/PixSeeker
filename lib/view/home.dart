import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixseeker/controller/images.dart';
import 'package:pixseeker/view/widgets/custom_text_field.dart';
import 'package:pixseeker/view/widgets/image_error_or_loading.dart';
import 'package:pixseeker/view/widgets/image_grid_view.dart';

class PixabayView extends StatelessWidget {
  final PixabayController controller = Get.find<PixabayController>();

  PixabayView({super.key}) {
    controller.loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomSearchTextField(controller: controller),
          Expanded(
            child: Obx(
              () {
                if (controller.images.isEmpty) {
                  return ImageLoadingOrErrorWidget(controller: controller);
                }
                return ImageGridView(controller: controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}

