class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]';
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');

      // ✅ Check for multiple delimiters in format: //[delim1][delim2]\n
      final delimiterMatch = RegExp(r'//(\[.*?\])+').firstMatch(parts[0]);
      if (delimiterMatch != null) {
        delimiterPattern = parts[0]
            .substring(2)
            .split(RegExp(r'\]\[')) // Split multiple delimiters
            .map((d) => RegExp.escape(d.replaceAll(RegExp(r'[\[\]]'), ''))) // Remove brackets
            .join('|'); // Combine into regex pattern
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
