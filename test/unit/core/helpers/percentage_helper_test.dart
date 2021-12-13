import 'package:flutter_test/flutter_test.dart';
import 'package:skore/core/helpers/percentage_helper.dart';

void main() {
  group('Group of tests for percentage helper', () {
    test('Should calculate the correctly percentage when the user want to see the video progress status', () {
      const videoPercentage = 70.0; // min 0, max 100
      final result = PercentageHelper.getPercentageOfInt(videoPercentage, 1);

      expect(result, 0.7);
    });
  });
}
