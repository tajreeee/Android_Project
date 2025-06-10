import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserProfile(String uid, String name, String? avatarUrl) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'name': name,
    'avatarUrl': avatarUrl ?? '',
  });
}
