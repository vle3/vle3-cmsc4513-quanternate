enum PhotoSource {
  camera,
  gallery,
}

enum DocKeyPhotoMemo {
  title,
  memo,
  createdBy,
  photoFileName,
  photoURL,
  timestamp,
  lastseen,
}

class PhotoMemo {
  String? docId; // doc id generated by Firestore
  String createdBy; // email of the user
  String title;
  String memo;
  String photoFilename; // image / photo to store Storage
  String photoURL; // URL of the image
  String? lastseen;
  DateTime? timestamp;

  PhotoMemo({
    this.docId,
    required this.createdBy,
    required this.title,
    required this.memo,
    required this.photoFilename,
    required this.photoURL,
    this.timestamp,
    this.lastseen,
  }) {}

  PhotoMemo clone() {
    PhotoMemo copy = PhotoMemo(
      docId: docId,
      createdBy: createdBy,
      title: title,
      memo: memo,
      photoFilename: photoFilename,
      photoURL: photoURL,
      timestamp: timestamp,
      lastseen: lastseen,
    );
    return copy;
  }

  void copyFrom(PhotoMemo p) {
    docId = p.docId;
    createdBy = p.createdBy;
    title = p.title;
    memo = p.memo;
    photoFilename = p.photoFilename;
    photoURL = p.photoURL;
    timestamp = p.timestamp;
    lastseen = p.lastseen;
  }

  Map<String, dynamic> toFireStoreDoc() {
    return {
      DocKeyPhotoMemo.title.name: title,
      DocKeyPhotoMemo.createdBy.name: createdBy,
      DocKeyPhotoMemo.memo.name: memo,
      DocKeyPhotoMemo.photoFileName.name: photoFilename,
      DocKeyPhotoMemo.photoURL.name: photoURL,
      DocKeyPhotoMemo.timestamp.name: timestamp,
      DocKeyPhotoMemo.lastseen.name: lastseen,
    };
  }

  //deserialization
  factory PhotoMemo.fromFireStoreDoc({
    required Map<String, dynamic> doc,
    required String docId,
  }) {
    return PhotoMemo(
        docId: docId,
        createdBy: doc[DocKeyPhotoMemo.createdBy.name] ??= '',
        title: doc[DocKeyPhotoMemo.title.name] ??= '',
        memo: doc[DocKeyPhotoMemo.memo.name] ??= '',
        photoFilename: doc[DocKeyPhotoMemo.photoFileName.name] ??= '',
        photoURL: doc[DocKeyPhotoMemo.photoURL.name] ??= '',
        timestamp: doc[DocKeyPhotoMemo.timestamp.name] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                doc[DocKeyPhotoMemo.timestamp.name].millisecondsSinceEpoch,
              )
            : null,
        lastseen: doc['Time_seen'] ??= '');
  }

  bool isValid() {
    if (createdBy.isEmpty ||
        title.isEmpty ||
        memo.isEmpty ||
        photoFilename.isEmpty ||
        photoURL.isEmpty ||
        timestamp == null) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateTitle(String? value) {
    return (value == null || value.trim().length < 3)
        ? 'Title too short'
        : null;
  }

  static String? validateMemo(String? value) {
    return (value == null || value.trim().length < 5) ? 'Memo too short' : null;
  }
}
