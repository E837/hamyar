class Note {
  String title;
  String content;
  DateTime modificationDate = DateTime.now();

  Note({
    required this.title,
    required this.content,
  });

  void modify(String title, String content) {
    this.title = title;
    this.content = content;
    modificationDate = DateTime.now();
  }
}
