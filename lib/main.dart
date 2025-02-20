import 'package:string_calculator_tdd/string_calculator_tdd.dart';

void main() {
  final calculator = StringCalculator();

  try {
    print(calculator.add('1500,500,2000,1000,1'));
  } catch (e) {
    print('Error: $e'); // Should display the correct error message
  }
}
