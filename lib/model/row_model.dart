class Row {
  final String id;
  final String text;
  final int position;
  final bool visible;

  Row({this.id, this.text, this.position, this.visible});

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      id: json['id'],
      text: json['text'],
      position: json['position'],
      visible: json['visible'],
    );
  }
}
