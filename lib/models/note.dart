import 'package:flutter/cupertino.dart';

class Note with ChangeNotifier {
  String _title;
  String _content;
  final DateTime _modificationDate;

  Note({
    required title,
    required content,
    DateTime? modificationDate,
  })  : _title = title,
        _content = content,
        _modificationDate = modificationDate ?? DateTime.now();

  String get title => _title;

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String get content => _content;

  set content(String value) {
    _content = value;
    notifyListeners();
  }

  DateTime get modificationDate => _modificationDate;
}
