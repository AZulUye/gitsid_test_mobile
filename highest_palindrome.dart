void main() {
  print(findHighestPalindrome('3643', 1));
  print(findHighestPalindrome('972239', 2));
}

String findHighestPalindrome(String s, int k) {
  List<String> digits = s.split('');
  return _findHighestPalindromeHelper(digits, k);
}

String _findHighestPalindromeHelper(List<String> digits, int k) {
  int len = digits.length;
  int minChanges = 0;

  for (int i = 0; i < len ~/ 2; i++) {
    if (digits[i] != digits[len - 1 - i]) {
      minChanges++;
    }
  }

  if (minChanges > k) {
    return '-1';
  }

  for (int i = 0; i < len ~/ 2; i++) {
    int j = len - 1 - i;

    if (digits[i] != digits[j]) {
      if (int.parse(digits[i]) > int.parse(digits[j])) {
        digits[j] = digits[i];
      } else {
        digits[i] = digits[j];
      }
      k--;
    }
  }

  if (k > 0) {
    for (int i = 0; i < len ~/ 2; i++) {
      int j = len - 1 - i;

      if (k >= 2 && digits[i] != '9') {
        digits[i] = '9';
        digits[j] = '9';
        k -= 2;
      } else if (k >= 1 && digits[i] == digits[j] && digits[i] != '9') {
        digits[i] = '9';
        digits[j] = '9';
        k--;
      }

      if (k == 0) break;
    }

    if (k > 0 && len % 2 == 1 && digits[len ~/ 2] != '9') {
      digits[len ~/ 2] = '9';
    }
  }

  return digits.join();
}
