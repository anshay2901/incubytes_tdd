import 'package:string_calculator_tdd/string_calculator_tdd.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    test('returns 0 for an empty string', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), equals(0));
    });
    test('returns number itself for a single number', () {
      final calculator = StringCalculator();
      expect(calculator.add('1'), equals(1));
    });
    test('returns sum of two numbers', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,2'), equals(3));
    });

  });
}
