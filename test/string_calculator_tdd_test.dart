import 'package:string_calculator_tdd/string_calculator_tdd.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    test('returns 0 for an empty string', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), equals(0));
    });
  });
}
