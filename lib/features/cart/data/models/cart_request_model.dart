class CartRequestModel {
  CartRequestModel({
    required this.productId,
  });

  final int? productId;

  factory CartRequestModel.fromJson(Map<String, dynamic> json) {
    return CartRequestModel(
      productId: json["product_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
