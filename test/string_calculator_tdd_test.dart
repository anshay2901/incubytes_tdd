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
    test('returns sum of multiple numbers', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,2,3,4'), equals(10));
    });
    test('handles new line as delimiter', () {
      final calculator = StringCalculator();
      expect(calculator.add('1\n2,3'), equals(6));
    });
    test('supports different delimiters', () {
      final calculator = StringCalculator();
      expect(calculator.add('//;\n1;2'), equals(3));
    });
    test('throws exception for negative numbers', () {
      final calculator = StringCalculator();

      try {
        calculator.add('1,-2,3,-4');
      } catch (e) {
        print('Exception caught: $e'); // Debugging output
      }

      expect(
            () => calculator.add('1,-2,3,-4'),
        throwsA(predicate((e) =>
        e is Exception && e.toString().contains('Negative numbers not allowed: -2, -4')
        )),
      );
    });
  });
  test('ignores numbers greater than 1000', () {
    final calculator = StringCalculator();
    expect(calculator.add('2,1001'), equals(2));
    expect(calculator.add('1000,2'), equals(1002)); // 1000 should be included
    expect(calculator.add('1500,500,2000,1000,1'), equals(1501)); // 1500, 2000 ignored
  });



}
