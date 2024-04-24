import 'dart:async';
import 'dart:developer';

// Import required packages
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pixseeker/models/pixabay_responce_model.dart';
import 'package:pixseeker/models/pixbay_image.dart';
import 'package:pixseeker/view/single_image_screen.dart';

class PixabayController extends GetxController {
  // API key for Pixabay API
  final String apiKey;

  // State variables (all observable using GetX)
  final RxString searchQuery = ''.obs; // Search query
  final RxInt currentPage = 1.obs; // Current page number
  final RxList<PixabayImage> images =
      RxList<PixabayImage>([]); // List of images

  PixabayController(this.apiKey);

  // Timer for debounce logic
  Timer? _searchDebounce;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in searchQuery and trigger _onSearch
    ever(searchQuery, _onSearch);
  }

  Future<void> _onSearch(String query) async {
    _searchDebounce?.cancel(); // Cancel any pending timer

    _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      // Debounce time elapsed, perform search
      images.value = []; // Clear previous results
      currentPage.value = 1;
      images.value = await fetchImages(query, currentPage.value);
    });
  }

  Future<void> loadImage() async {
    currentPage.value++;
    images.value = [
      ...images,
      ...await fetchImages(
        searchQuery.value,
        currentPage.value,
      ),
    ];
  }

  Future<List<PixabayImage>> fetchImages(String query, int page) async {
    final url =
        'https://pixabay.com/api/?key=$apiKey&q=$query&per_page=30&page=$page';

    try {
      // Use Dio for HTTP requests
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        // Parse response using PixabayModel.fromJson
        return PixabayModel.fromJson(response.data).images;
      } else {
        log('Error fetching images: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      // Handle potential errors during network requests
      log('Error fetching images: $error');
      return [];
    }
  }

  void openImageFullscreen(PixabayImage image) {
    Get.to(
      SingleImageScreen(image: image),
      transition: Transition.cupertino,
    );
  }
}
