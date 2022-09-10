class StateService {
  static final List<String> states = [
    'اشعار خصم',
    'قبض عميل',
    'قبض اخرى',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.contains(query));
    return matches;
  }
}
