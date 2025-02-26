// validators.dart

class Validators {
  // Validates that the input is not empty
  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  // Validates that name is not empty
  static String? validateName (String? value) {
    if (value?.isEmpty ?? true) {
      return "Name is required!";
    }
    else if(value!.length < 3) {
      return "Name is too short!";
    }
    return null;
  }

  // Validates that the input is a valid email address
  static String? validateEmail(String? value) {
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validates that the input is a valid phone number
  static String? validatePhoneNumber(String? value) {
    const phonePattern = r'^\+?[0-9]{7,15}$';
    final regex = RegExp(phonePattern);
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Validates that the input is a valid password
  static String? passFieldValidator (String? value) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value?.isEmpty ?? true) {
      return "Field is required!";
    } else if (!regex.hasMatch(value!)) {
      return "Password: 8 characters, uppercase, lowercase, number, special character";
    }
    return null;
  }
}