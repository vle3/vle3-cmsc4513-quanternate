import 'dart:io';

import 'package:facialrecognitionapp/model/photomemo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePhotoMemoScreenModel {
  User user;
  File? photo;
  late PhotoMemo tempMemo;
  String? progressMessage;

  CreatePhotoMemoScreenModel({required this.user}) {
    tempMemo = PhotoMemo(
      createdBy: user.email!,
      title: '',
      memo: '',
      photoFilename: '',
      photoURL: '',
    );
  }

  void saveTitle(String? value) {
    if (value != null) {
      tempMemo.title = value;
    }
  }

  void saveMemo(String? value) {
    if (value != null) {
      tempMemo.memo = value;
    }
  }
}
