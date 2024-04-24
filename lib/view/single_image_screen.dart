import 'package:flutter/material.dart';
import 'package:pixseeker/models/pixbay_image.dart';

class SingleImageScreen extends StatelessWidget {
  const SingleImageScreen({super.key, required this.image});
  final PixabayImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: image.id,
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image.webformatURL),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
