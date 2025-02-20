import 'package:string_calculator_tdd/string_calculator_tdd.dart';

void main() {
  final calculator = StringCalculator();

  try {
    print(calculator.add('1,-2,3,-4'));
  } catch (e) {
    print('Error: $e'); // Should display the correct error message
  }
}
