class Date {
  static DateTime now() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
