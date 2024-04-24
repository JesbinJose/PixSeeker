
import 'package:flutter/material.dart';
import 'package:pixseeker/controller/images.dart';
import 'package:pixseeker/models/pixbay_image.dart';

class SingleImageTile extends StatelessWidget {
  const SingleImageTile({
    super.key,
    required this.controller,
    required this.image,
  });

  final PixabayController controller;
  final PixabayImage image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        onTap: () => controller.openImageFullscreen(image),
        child: Hero(
          tag: image.id,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(image.webformatURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 5),
                ),
              ),
              Text(
                '${image.likes} likes - ${image.views} views',
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
