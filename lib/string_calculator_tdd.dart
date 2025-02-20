class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    print(numbers.split(RegExp('[,\n]')));
    return numbers.split(RegExp('[,\n]')).map(int.parse).reduce((a, b) => a + b);
  }



}
