class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]';
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');

      // ✅ Check for multi-character delimiter format
      final delimiterMatch = RegExp(r'//\[(.*?)\]').firstMatch(parts[0]);
      if (delimiterMatch != null) {
        delimiterPattern = RegExp.escape(delimiterMatch.group(1)!);
      } else {
        delimiterPattern = RegExp.escape(parts[0].substring(2));
      }

      numbers = parts[1];
    }

    var numList = numbers
        .split(RegExp(delimiterPattern))
        .where((n) => n.isNotEmpty)
        .map(int.parse)
        .toList();

    var negatives = numList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('Negative numbers not allowed: ${negatives.join(", ")}');
    }

    return numList.where((n) => n <= 1000).fold(0, (a, b) => a + b);
  }
}
