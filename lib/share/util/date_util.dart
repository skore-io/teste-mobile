import 'package:intl/intl.dart';

extension DateUtil on DateTime {
  String toFormatString({pattern = "dd/MM/yyyy"}) {
    DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.format(this);
  }

  static String formatMillis(int milliseconds, {String pattern = "dd/MM/yyyy"}) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return dateTime.toFormatString(pattern: pattern);
  }
}
