class DateUtil {
  static DateTime getTodaysDate() {
    final all = DateTime.now();
    final year = all.year, month = all.month, day = all.day;
    return DateTime(year, month, day);
  }
}
