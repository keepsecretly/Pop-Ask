class Choice {
  final String description;
  final String id;
  final String text;
  final int position;
  final bool visible;

  Choice({this.description, this.id, this.text, this.position, this.visible});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      description: json['description'],
      id: json['id'],
      text: json['text'],
      position: json['position'],
      visible: json['visible'],
    );
  }
}
