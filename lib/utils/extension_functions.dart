extension StringExtension on String {
  String initCaps() {
    if (isEmpty) {
      return this;
    } else {
      return split(' ').map((word) => word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}').join(' ');
    }
  }
}
