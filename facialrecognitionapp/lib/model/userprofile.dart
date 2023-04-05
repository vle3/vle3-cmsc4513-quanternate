enum PhotoSource {
  camera,
  gallery,
}

enum DocKeyUserProfile {
  name,
  dob,
  photoFileName,
  photoURL,
  timestamp,
}

class UserProfile {
  String name;
  String dob;
  String photoFileName;
  String photoURL;
  DateTime? timestamp;

  UserProfile({
    required this.name,
    required this.dob,
    required this.photoFileName,
    required this.photoURL,
    this.timestamp,
  }) {}
}
