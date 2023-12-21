class Estimation {
  final int weeks;
  final int price;
  final String description;

  const Estimation(
      {required this.weeks, required this.price, required this.description});

  Estimation copyWith({
    int? weeks,
    int? price,
    String? description,
  }) {
    return Estimation(
      weeks: weeks ?? this.weeks,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}
