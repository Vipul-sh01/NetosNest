import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? emailOrMobile;
  final String? password;
  final String? name;
  final String? block;
  final String? roomNo;
  final String? profilePic;
  final String? bio;
  final bool? isVerified;
  final int? notesPurchased;
  final int? notesSold;
  final DateTime? createdAt;

  UserModel({
    this.uid,
    this.emailOrMobile,
    this.password,
    this.name,
    this.block,
    this.roomNo,
    this.profilePic,
    this.bio,
    this.isVerified,
    this.notesPurchased,
    this.notesSold,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    emailOrMobile: json['emailOrMobile'],
    password: json['password'],
    name: json['name'],
    block: json['block'],
    roomNo: json['roomNo'],
    profilePic: json['profilePic'],
    bio: json['bio'],
    isVerified: json['isVerified'],
    notesPurchased: json['notesPurchased'],
    notesSold: json['notesSold'],
    createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'emailOrMobile': emailOrMobile,
    'password': password,
    'name': name,
    'block': block,
    'roomNo': roomNo,
    'profilePic': profilePic ?? " ",
    'bio': bio,
    'isVerified': isVerified,
    'notesPurchased': notesPurchased,
    'notesSold': notesSold,
    'createdAt': createdAt,
  };
}
