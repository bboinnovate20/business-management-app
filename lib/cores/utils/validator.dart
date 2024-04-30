String? isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(email) ? null : 'Please enter valid Email';
}

String? isValidName(String name, {String field='Name'}) {
  return name.length > 3 ? null : 'Please enter valid $field';
}

String? isValidPassword(String text, {int length = 5}) {
  return text.length >= length ? null : 'Password must be greater than $length';
}

String? nameLength(String text, {int length = 5}) {
  return text.isEmpty ? null : text.length >= length ? null : 'Enter enter $length character';
}

String? isValidTwoWordName(String name) {
  
  final List<String> words = name.trim().split(' ');
  return words.length >= 2 && words.every((word) => word.length > 3)? null : 'Please Enter valid Surname and Name';
}


String? compareText(String text1, String text2, message) {
 
  return text1 == text2  ? null : message;
}