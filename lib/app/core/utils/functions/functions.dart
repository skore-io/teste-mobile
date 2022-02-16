import 'package:intl/intl.dart';

class Functions {
  convertMillisecondsSinceEpochInDateTime(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  convertDateTimeinString(DateTime date) {
    String result = DateFormat('dd/MM/yyyy').format(date);

    return result;
  }
}
