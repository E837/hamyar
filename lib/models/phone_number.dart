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
    switch (type) {
      case PhoneType.main:
        return 'Main';
      case PhoneType.mobile:
        return 'Mobile';
      case PhoneType.work:
        return 'Work';
      case PhoneType.home:
        return 'Home';
    }
  }

  static List<String> phoneTypeItems() {
    final List<String> result = [];
    for (var type in PhoneType.values) {
      result.add(typeToString(type));
    }
    return result;
  }
}
