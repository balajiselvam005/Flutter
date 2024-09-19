import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  final String uid;
  final String email;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJason() => {
        'uid': uid,
        'email': email,
        'username': username,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };
}
