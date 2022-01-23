class Date {
  static final _today = DateTime.now();

  static DateTime now() {
    return DateTime(_today.year, _today.month, _today.day);
  }

  static DateTime currentMonth() {
    return DateTime(_today.year, _today.month, 1);
  }
}
