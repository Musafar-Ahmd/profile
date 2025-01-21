extension StringExtention on String {
  String get imagePath => 'assets/images/$this';

  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}
