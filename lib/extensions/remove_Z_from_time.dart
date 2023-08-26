extension RemoveZFromTime on String {
  String get removeZFromDate {
    if (contains("Z")) {
      return replaceRange(length - 1, length, "");
    } else {
      return this;
    }
  }
}
