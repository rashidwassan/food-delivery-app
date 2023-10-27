class Validators {
  Validators._();

  static String? validateEmail(String? email) {
    if (email!.isNotEmpty) {
      if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        return null;
      }
    } else {
      return 'Email is required';
    }
    return 'Invalid email';
  }

  static String? validatePassword(String? password) {
    if (password!.isNotEmpty) {
      if (password.length < 6) {
        return 'Password must be at least 6 characters';
      }
      return null;
    } else {
      return 'Password is required';
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber!.isNotEmpty) {
      if (RegExp(r"^[0-9]{11}$").hasMatch(phoneNumber)) {
        return null;
      }
      return 'Invalid phone number';
    } else {
      return 'Phone number is required';
    }
  }

  static String? validateName(String? name) {
    if (name!.isNotEmpty) {
      if (RegExp(r"^[a-zA-Z ]+$").hasMatch(name)) {
        return null;
      }
      return 'Invalid name';
    } else {
      return 'Name is required';
    }
  }
}
