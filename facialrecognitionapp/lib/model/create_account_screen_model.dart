class CreateAccountScreenModel {
  String? name;
  String? email;
  String? password;
  String? passwordConfirm;
  bool showPassword = false;

  String? validateName(String? value) {
    if (value == null || value.length < 1) {
      return 'Invalid name';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || !(value.contains('@') && value.contains('.'))) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password too short (min 6 chars)';
    } else {
      return null;
    }
  }

  void saveName(String? value) {
    name = value;
  }

  void saveEmail(String? value) {
    email = value;
  }

  void savePassword(String? value) {
    password = value;
  }

  void savePasswordConfirm(String? value) {
    passwordConfirm = value;
  }
}
