import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// Receive a [DateTime] date and returns a yMd [String].
String formatDateTimeAsString({
  required DateTime dateTime,
  required BuildContext context,
}) {
  final locale = Localizations.localeOf(context);
  initializeDateFormatting(locale.toLanguageTag());

  final formatter = DateFormat.yMd(locale.toLanguageTag());

  return formatter.format(dateTime);
}
