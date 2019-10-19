class Required {
  final String text;

  Required({this.text});

  factory Required.fromJson(Map<String, dynamic> json) {
    var textJson = json['text'];
    var text;

    if (textJson != null) {
      text = json['text'];
    }

    return Required(
      text: text,
    );
  }
}
