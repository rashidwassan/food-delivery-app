class Utilities {
  static String dateTimeToString(DateTime dateTime) {
    final List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    final String dayOfWeek = daysOfWeek[dateTime.weekday - 1];
    final String formattedDate =
        '$dayOfWeek, ${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${(dateTime.year).toString().padLeft(2, '0')}';

    final String hour = dateTime.hour > 12
        ? (dateTime.hour % 12).toString().padLeft(2, '0')
        : dateTime.hour.toString().padLeft(2, '0');
    final String minute = dateTime.minute.toString().padLeft(2, '0');
    final String amPm = dateTime.hour < 12 ? 'AM' : 'PM';

    return '$formattedDate @ $hour:$minute $amPm';
  }
}
