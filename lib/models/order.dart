enum Status { pending, processing, completed, canceled }

class SFOrder {
  final String id;
  final String userId;
  final List<String> foodIds;
  final double totalAmount;
  final DateTime orderDate;
  final Status status;

  SFOrder({
    required this.id,
    required this.userId,
    required this.foodIds,
    required this.totalAmount,
    required this.orderDate,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'foodIds': foodIds,
      'totalAmount': totalAmount,
      'orderDate': orderDate.toUtc().toIso8601String(),
      'status': status.toString().split('.').last, // Convert enum to string
    };
  }

  factory SFOrder.fromJson(Map<String, dynamic> json) {
    return SFOrder(
      id: json['id'],
      userId: json['userId'],
      foodIds: List<String>.from(json['foodIds']),
      totalAmount: json['totalAmount'],
      orderDate: DateTime.parse(json['orderDate']),
      status: Status.values.firstWhere(
        (status) => status.toString() == 'Status.${json['status']}',
        orElse: () => Status.pending,
      ),
    );
  }
}
