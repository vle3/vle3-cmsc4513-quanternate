class ChangePasswordScreenModel {
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirm;

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password too short (min 6 chars)';
    } else {
      return null;
    }
  }

  void savePassword(String? value) {
    newPassword = value;
  }
}
