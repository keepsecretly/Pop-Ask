class DisplayOption {
  final String displayType;
  final String displaySubType;
  final int leftLabel;
  final int rightLabel;

  DisplayOption({
    this.displayType,
    this.displaySubType,
    this.leftLabel,
    this.rightLabel,
  });

  factory DisplayOption.fromJson(Map<String, dynamic> json) {
    return DisplayOption(
      displayType: json['display_type'],
      displaySubType: json['display_subtype'],
      leftLabel: json['left_label'],
      rightLabel: json['right_label'],
    );
  }
}
