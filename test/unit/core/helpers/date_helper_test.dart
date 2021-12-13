import 'package:flutter_test/flutter_test.dart';
import 'package:skore/core/helpers/date_helper.dart';

void main() {
  group('Group of tests for date helper', () {
    test('Should reuturn a DateTime when the user want to see a date of lesson', () {
      const timeStampDate = 1571323199864;
      final result = DateHelper.getDateByEpoch(timeStampDate);

      expect(result, isA<DateTime>());
    });

    test('Should reuturn a valid DateTime when the user want to convert timestamp to Date', () {
      const timeStampDate = 1571323199864;
      final result = DateHelper.getDateByEpoch(timeStampDate);

      expect(result.toString(), '2019-10-17 11:39:59.864');
    });

    test('Should return a date formated when the user want to see a formated date', () {
      final dateToFormat = DateTime.parse('2019-10-17 11:39:59.864');
      final result = DateHelper.getDateFormated(dateToFormat);

      expect(result, '17-10-2019');
    });
  });
}
