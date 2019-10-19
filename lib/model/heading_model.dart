class Heading {
  final String heading;

  Heading({this.heading});

  factory Heading.fromJson(Map<String, dynamic> json) {
    return Heading(
      heading: json['heading'],
    );
  }
}
