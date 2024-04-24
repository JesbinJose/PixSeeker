class PixabayImage {
  final int id;
  final String previewURL;
  final String webformatURL;
  final String largeImageURL;
  final String pageURL;
  final int likes;
  final int views;

  PixabayImage({
    required this.id,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.likes,
    required this.views,
    required this.pageURL,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(
      id: json['id'] as int,
      previewURL: json['previewURL'] as String,
      webformatURL: json['webformatURL'] as String,
      largeImageURL: json['largeImageURL'] as String,
      pageURL: json['pageURL'] as String,
      likes: json['likes'] == null ? 0 : json['likes'] as int,
      views: json['views'] == null ? 0 : json['views'] as int,
    );
  }
}
