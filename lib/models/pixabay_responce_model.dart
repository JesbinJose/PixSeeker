import 'package:pixseeker/models/pixbay_image.dart';

class PixabayModel {
  final int total;
  final int totalHits;
  final List<PixabayImage> images;

  PixabayModel({
    required this.total,
    required this.totalHits,
    required this.images,
  });

  factory PixabayModel.fromJson(Map<String, dynamic> json) {
    final List<PixabayImage> images = [];
    for (var image in json["hits"]) {
      images.add(PixabayImage.fromJson(image));
    }
    return PixabayModel(
      total: json['total'] as int,
      totalHits: json['totalHits'] as int,
      images: images,
    );
  }
}
