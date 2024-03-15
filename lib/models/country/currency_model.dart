class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] as String? ?? "",
      symbol: json['symbol'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
    };
  }
}