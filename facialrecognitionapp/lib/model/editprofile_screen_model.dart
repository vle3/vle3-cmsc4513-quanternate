import 'dart:io';

import 'package:facialrecognitionapp/model/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreenModel {
  User user;
  File? photo;
  late UserProfile tempProfile;
  String? progressMessage;

  EditProfileScreenModel({required this.user}) {
    tempProfile = UserProfile(
      name: '',
      dob: '',
      photoFileName: '',
      photoURL: '',
    );
  }
}
