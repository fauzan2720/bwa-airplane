import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String photoUrl;
  final String hobby;
  final int balance;
  final String? createdAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    this.hobby = '',
    this.balance = 0,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, email, name, photoUrl, hobby, balance];
}
