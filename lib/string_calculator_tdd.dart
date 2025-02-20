class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]'; // Default delimiters
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiterPattern = RegExp.escape(parts[0].substring(2));
      numbers = parts[1];
    }

    return numbers.split(RegExp(delimiterPattern)).map(int.parse).reduce((a, b) => a + b);
  }



}
