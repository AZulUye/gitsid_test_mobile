void main() {
  String input = "abbcccd";
  List<int> queries = [1, 3, 9, 8];

  List<String> result = weightedStrings(input, queries);
  print(result);
}

List<String> weightedStrings(String s, List<int> queries) {
  Map<String, int> charWeights = {};
  for (int i = 0; i < 26; i++) {
    charWeights[String.fromCharCode('a'.codeUnitAt(0) + i)] = i + 1;
  }

  Set<int> possibleWeights = {};

  int count = 1;
  for (int i = 0; i < s.length; i++) {
    int weight = charWeights[s[i]]!;

    possibleWeights.add(weight);

    if (i > 0 && s[i] == s[i - 1]) {
      count++;
    } else {
      count = 1;
    }

    possibleWeights.add(weight * count);
  }

  List<String> result = [];
  for (int query in queries) {
    result.add(possibleWeights.contains(query) ? 'Yes' : 'No');
  }

  return result;
}
