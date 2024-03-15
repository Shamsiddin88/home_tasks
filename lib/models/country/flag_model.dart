class Flag {
  final String png;
  final String svg;

  Flag({
    required this.png,
    required this.svg,
  });

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      png: json['png'] as String? ?? "",
      svg: json['svg'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
    };
  }
}