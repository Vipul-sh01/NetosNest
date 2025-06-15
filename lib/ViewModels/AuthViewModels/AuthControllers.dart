import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Models/UserModels.dart';
import '../../Services/AuthServices/AuthServices.dart';
import '../../Utility/showImagePickerDialog.dart';
import '../../Utility/showSnackbar.dart';
import '../../Views/Authentication/LoginScreen.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailOrMobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController blockController = TextEditingController();

  final isLoading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);

  UserModel? currentUser;

  /// Register and save user data in Firestore
  Future<bool> registerSubmit() async {
    String name = nameController.text.trim();
    String emailOrMobile = emailOrMobileController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || emailOrMobile.isEmpty || password.isEmpty) {
      DialogUtils.showSnackbar("Error", "All fields are required", isError: true);
      return false;
    }

    try {
      isLoading.value = true;

      UserModel tempUser = UserModel(
        name: name,
        emailOrMobile: emailOrMobile,
        password: password,
      );

      UserModel? newUser = await authService.registerUser(
        emailOrMobile: emailOrMobile,
        password: password,
        userData: tempUser,
      );

      if (newUser != null) {
        currentUser = newUser;
        DialogUtils.showSnackbar("Success", "Registration successful");
        return true;
      } else {
        DialogUtils.showSnackbar("Error", "Failed to register", isError: true);
        return false;
      }
    } catch (e) {
      DialogUtils.showSnackbar("Error", "Failed to register: $e", isError: true);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Login user and load user data from Firestore
  Future<bool> logInUsers() async {
    String emailOrMobile = emailOrMobileController.text.trim();
    String password = passwordController.text.trim();

    if (emailOrMobile.isEmpty || password.isEmpty) {
      DialogUtils.showSnackbar("Error", "Please enter Email/Mobile and Password", isError: true);
      return false;
    }

    try {
      isLoading.value = true;

      UserModel? loggedInUser = await authService.logInUser(
        emailOrMobile: emailOrMobile,
        password: password,
      );

      if (loggedInUser != null) {
        currentUser = loggedInUser;
        DialogUtils.showSnackbar("Success", "Login successful");
        return true;
      } else {
        DialogUtils.showSnackbar("Error", "Invalid credentials", isError: true);
        return false;
      }
    } catch (e) {
      DialogUtils.showSnackbar("Error", "Login error: $e", isError: true);
      return false;
    } finally {
      isLoading.value = false;
    }
  }


  /// Show image picker dialog
  void getDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Select Image'),
        content: SingleChildScrollView(
          child: ImagePickerDialog(
            onImagePicked: (File pickedImage) {
              imageFile.value = pickedImage;
            },
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  /// Update user data
  Future<bool> updateUser() async {
    if (currentUser == null) {
      DialogUtils.showSnackbar("Error", "User not found", isError: true);
      return false;
    }

    isLoading.value = true;

    try {
      final updatedUser = UserModel(
        uid: currentUser!.uid, // Must include UID for Firestore doc
        name: nameController.text.trim(),
        emailOrMobile: currentUser!.emailOrMobile,
        password: currentUser!.password,
        block: blockController.text.trim(),
        roomNo: roomNoController.text.trim(),
        profilePic: currentUser!.profilePic,
        bio: currentUser!.bio,
        isVerified: currentUser!.isVerified ?? false,
        notesPurchased: currentUser!.notesPurchased ?? 0,
        notesSold: currentUser!.notesSold ?? 0,
        createdAt: currentUser!.createdAt ?? DateTime.now(),
      );

      await authService.updateUserData(updatedUser, imageFile.value);

      currentUser = updatedUser;
      DialogUtils.showSnackbar("Success", "User updated successfully");
      return true;
    } catch (e) {
      DialogUtils.showSnackbar("Error", "Failed to update user: $e", isError: true);
      return false;
    } finally {
      isLoading.value = false;
    }
  }


  /// Dispose all controllers
  @override
  void onClose() {
    nameController.dispose();
    emailOrMobileController.dispose();
    passwordController.dispose();
    roomNoController.dispose();
    departmentController.dispose();
    blockController.dispose();
    super.onClose();
  }
}