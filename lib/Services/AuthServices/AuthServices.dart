import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../Models/UserModels.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Register user with Firebase Auth + Firestore using UserModel
  Future<UserModel?> registerUser({
    required String emailOrMobile,
    required String password,
    required UserModel userData,
  }) async {
    try {
      final email = _formatToEmail(emailOrMobile);
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;
      final newUser = UserModel(
        uid: uid,
        emailOrMobile: emailOrMobile,
        password: password,
        name: userData.name,
        block: userData.block,
        roomNo: userData.roomNo,
        profilePic: userData.profilePic,
        bio: userData.bio,
        isVerified: false,
        notesPurchased: 0,
        notesSold: 0,
        createdAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(uid).set(newUser.toJson());

      return newUser;
    } catch (e) {
      print('Error registering user: $e');
      return null;
    }
  }

  /// Login user and fetch UserModel from Firestore
  Future<UserModel?> logInUser({
    required String emailOrMobile,
    required String password,
  }) async {
    try {
      final email = _formatToEmail(emailOrMobile);
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('User data not found in Firestore');
        return null;
      }
    } catch (e) {
      print('Error logging in user: $e');
      return null;
    }
  }

  Future<void> updateUserData(UserModel user, File? image) async {
    try {
      String? profilePic = user.profilePic;
      final docRef = _firestore.collection('users').doc(user.uid);
      final docSnapshot = await docRef.get();
      String? oldProfilePic = docSnapshot.data()?['profilePic'];
      if (image != null) {
        if (oldProfilePic != null && oldProfilePic.isNotEmpty && oldProfilePic != " ") {
          try {
            final oldRef = FirebaseStorage.instance.refFromURL(oldProfilePic);
            await oldRef.delete();
            print("Old image deleted successfully.");
          } catch (e) {
            print("Failed to delete old image: $e");
          }
        }
        final ref = _storage.ref().child("images/${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg");

        final uploadTask = ref.putFile(image);
        final snapshot = await uploadTask.whenComplete(() => null);

        if (snapshot.state == TaskState.success) {
          profilePic = await snapshot.ref.getDownloadURL();
        } else {
          throw Exception("Image upload failed");
        }
      }

      // Update user data
      final dataToUpdate = {
        'name': user.name,
        'block': user.block,
        'roomNo': user.roomNo,
        'profilePic': profilePic,
        'bio': user.bio,
        'isVerified': user.isVerified,
        'notesPurchased': user.notesPurchased,
        'notesSold': user.notesSold,
        'createdAt': Timestamp.fromDate(user.createdAt ?? DateTime.now()),
      };

      if (docSnapshot.exists) {
        await docRef.update(dataToUpdate);
      } else {
        await docRef.set(dataToUpdate);
      }
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  /// Convert mobile to dummy email format if needed
  String _formatToEmail(String input) {
    if (input.contains('@')) return input;
    return "$input@dummy.com";
  }
}
