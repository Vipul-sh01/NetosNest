import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/UserModels.dart';

class FacebookAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential =
      FacebookAuthProvider.credential(accessToken.tokenString);

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        final userDocRef = _firestore.collection('users').doc(user.uid);
        final docSnapshot = await userDocRef.get();
        if (!docSnapshot.exists) {
          final newUser = UserModel(
            uid: user.uid,
            emailOrMobile: user.email ?? user.phoneNumber ?? "",
            password: null,
            name: user.displayName ?? "",
            block: null,
            roomNo: null,
            profilePic: user.photoURL,
            bio: "",
            isVerified: user.emailVerified,
            notesPurchased: 0,
            notesSold: 0,
            createdAt: DateTime.now(),
          );

          await userDocRef.set(newUser.toJson());
          return newUser;
        } else {
          // Return existing user
          return UserModel.fromJson(docSnapshot.data()!);
        }
      }
    }

    return null; // On cancel or failure
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}
