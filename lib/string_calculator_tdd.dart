class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    var numList = numbers.split(',').map(int.parse).toList();
    return numList.reduce((a, b) => a + b);
  }

}
