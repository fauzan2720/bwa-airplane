import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({
    super.key,
    required this.currentIndex,
    required this.photos,
  });
  final int currentIndex;
  final List photos;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      pageController: PageController(
        initialPage: currentIndex,
      ),
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(photos[index]),
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const SizedBox();
          },
        );
      },
      itemCount: photos.length,
    );
  }
}
