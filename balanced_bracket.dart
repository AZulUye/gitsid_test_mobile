void main() {
  final testCases = [
    "{ [ ( ) ] }",
    "{ [( ])}",
    "{(([ ])[ ])[ ]}",
  ];

  for (var test in testCases) {
    print("Input: $test");
    print("Output: ${checkBrackets(test)}\n");
  }
}

final Map<String, String> bracketPairs = {
  "{": "}",
  "[": "]",
  "(": ")",
};

final List<String> bracketClosing =
    bracketPairs.entries.map((entry) => entry.value).toList();
String checkBrackets(String input) {
  return isBalancedBrackets(input) ? "YES" : "NO";
}

bool isBalancedBrackets(String input) {
  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String current = input[i];

    if (bracketPairs.containsKey(current)) {
      stack.add(current);
    } else if (bracketClosing.contains(current)) {
      if (stack.isEmpty) return false;

      String lastOpening = stack.removeLast();
      if (bracketPairs[lastOpening] != current) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}
