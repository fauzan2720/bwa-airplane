import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String? name;
  final String? city;
  final String? about;
  final String? imageUrl;
  final List<String>? interests;
  final List<String>? photos;
  final int? price;
  final double? rating;

  const DestinationModel({
    required this.id,
    this.name,
    this.city,
    this.about,
    this.imageUrl,
    this.interests,
    this.photos,
    this.price,
    this.rating,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      about: json['about'],
      imageUrl: json['image_url'],
      interests: json['interests'].cast<String>(),
      photos: json['photos'].cast<String>(),
      price: json['price'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'about': about,
        'image_url': imageUrl,
        'interests': interests,
        'photos': photos,
        'price': price,
        'rating': rating,
      };

  @override
  List<Object?> get props =>
      [name, city, about, imageUrl, interests, photos, price, rating];
}
