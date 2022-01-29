enum PhoneType {
  main,
  mobile,
  work,
  home,
}

class PhoneNumber {
  PhoneType type;
  String number;

  PhoneNumber({required this.type, required this.number});

  static String typeToString(PhoneType type) {
    final s = type.toString();
    // s content is like "PhoneType.main" so we need only the "main" part
    return s.substring(s.indexOf('.') + 1);
  }

  static List<PhoneType> phoneTypeItems({bool includeMain = true}) {
    final List<PhoneType> result = [];
    for (var type in PhoneType.values) {
      result.add(type);
    }
    if (!includeMain) {
      result.removeAt(0);
    }
    return result;
  }
}
