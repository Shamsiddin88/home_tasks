class Name {
  final String common;
  final String official;

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'] as String? ?? "",
      official: json['official'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'official': official,
    };
  }
}