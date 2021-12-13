import 'package:intl/intl.dart';

class DateHelper {
  static DateTime getDateByEpoch(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time);
  }

  static String getDateFormated(DateTime date) {
    final form = DateFormat('dd-MM-yyyy');

    return form.format(date);
  }
}
