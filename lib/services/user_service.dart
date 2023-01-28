import 'package:airplane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'photo_url': user.photoUrl,
        'hobby': user.hobby,
        'balance': user.balance,
        'created_at': DateTime.now().toString(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateBalance({
    required int balance,
  }) async {
    try {
      await _userReference.doc(FirebaseAuth.instance.currentUser!.uid).update({
        "balance": FieldValue.increment(balance),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot["email"],
        name: snapshot["name"],
        photoUrl: snapshot["photo_url"],
        hobby: snapshot["hobby"],
        balance: snapshot["balance"],
        createdAt: snapshot["created_at"],
      );
    } catch (e) {
      rethrow;
    }
  }
}
