import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List photos = [
      "https://picsum.photos/1000",
      "https://i.ibb.co/PGv8ZzG/me.jpg"
    ];

    return PhotoViewGallery.builder(
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
