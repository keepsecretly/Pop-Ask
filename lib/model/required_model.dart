class Required {
  final String text;

  Required({this.text});

  factory Required.fromJson(Map<String, dynamic> json) {
    return Required(
      text: json['text'],
    );
  }
}