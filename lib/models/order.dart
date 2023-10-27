class Order {
  final String id;
  final String userId;
  final List<String> foodIds;
  final double totalAmount;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.userId,
    required this.foodIds,
    required this.totalAmount,
    required this.orderDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'foodIds': foodIds,
      'totalAmount': totalAmount,
      'orderDate': orderDate.toUtc().toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      foodIds: List<String>.from(json['foodIds']),
      totalAmount: json['totalAmount'],
      orderDate: DateTime.parse(json['orderDate']),
    );
  }
}
