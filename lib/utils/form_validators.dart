String? Function(String?) get fieldValidator => (value) {
  if (value?.isEmpty ?? true) {
    return "Field is required!";
  }
  return null;
};

String? Function(String?) get nameValidator => (value) {
  if (value?.isEmpty ?? true) {
    return "Name is required!";
  }
  else if(value!.length < 3) {
    return "Name is too short!";
  }
  return null;
};

String? Function(String?) get emailValidator => (value) {
  if (value?.isEmpty ?? true) {
    return "Field is required!";
  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
      .hasMatch(value!)) {
    return "Please enter a valid email address";
  } else {
    return null;
  }
};

String? Function(String?) get passFieldValidator => (value) {
  RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value?.isEmpty ?? true) {
    return "Field is required!";
  } else if (!regex.hasMatch(value!)) {
    return "Password: 8 characters, uppercase, lowercase, number, special character";
  }
  return null;
};