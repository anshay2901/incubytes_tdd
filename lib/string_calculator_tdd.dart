class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]';
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiterPattern = RegExp.escape(parts[0].substring(2));
      numbers = parts[1];
    }

    var numList = numbers.split(RegExp(delimiterPattern)).map(int.parse).toList();

    var negatives = numList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('Negative numbers not allowed: ${negatives.join(", ")}');
    }

    return numList.reduce((a, b) => a + b);
  }
}
