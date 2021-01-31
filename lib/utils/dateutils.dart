class DateUtil {
  static DateTime getTodaysDate() {
    final all = DateTime.now();
    final year = all.year, month = all.month, day = all.day;
    return DateTime(year, month, day);
  }

  static DateTime getTomorrowsDate() {
    final all = DateTime.now();
    final year = all.year, month = all.month, day = all.day + 1;
    return DateTime(year, month, day);
  }

  static DateTime getDayAfterTomorrowsDate() {
    final all = DateTime.now();
    final year = all.year, month = all.month, day = all.day + 2;
    return DateTime(year, month, day);
  }
}
