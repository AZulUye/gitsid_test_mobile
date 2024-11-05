void main() {
  print(findHighestPalindrome('3643', 1));
  print(findHighestPalindrome('972239', 2));
  print(findHighestPalindrome('1224', 1));
  print(findHighestPalindrome('175231', 2));
  print(findHighestPalindrome('123321', 2));
  print(findHighestPalindrome('1532462381', 4));
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
    for (int i = 0; i < len ~/ 2 && k > 0; i++) {
      int j = len - 1 - i;

      if (digits[i] == digits[j]) {
        int currentDigit = int.parse(digits[i]);
        for (int d = currentDigit + 1; d <= 9 && k >= 2; d++) {
          digits[i] = d.toString();
          digits[j] = d.toString();
          k -= 2;
        }
      } else if (k >= 1) {
        int leftDigit = int.parse(digits[i]);
        int rightDigit = int.parse(digits[j]);
        int startDigit = leftDigit > rightDigit ? leftDigit : rightDigit;
        for (int d = startDigit + 1; d <= 9 && k >= 1; d++) {
          digits[i] = d.toString();
          digits[j] = d.toString();
          k--;
        }
      }
    }

    if (k > 0 && len % 2 == 1) {
      int middleDigit = int.parse(digits[len ~/ 2]);
      for (int d = middleDigit + 1; d <= 9 && k > 0; d++) {
        digits[len ~/ 2] = d.toString();
        k--;
      }
    }
  }

  return digits.join();
}
