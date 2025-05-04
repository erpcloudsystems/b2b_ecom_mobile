extension EmptyStringExtension on String {
  String guardEmptyString() {
    if (isEmpty) {
      return '-';
    }
    return this;
  }
}

extension HardCodedStringExtension on String {
  String get hardCoded {
    return this;
  }
}
