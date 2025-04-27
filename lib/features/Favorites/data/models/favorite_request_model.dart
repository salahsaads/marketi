class FavoriteRequestModel {
  FavoriteRequestModel({
    required this.productId,
  });

  final int? productId;

  factory FavoriteRequestModel.fromJson(Map<String, dynamic> json) {
    return FavoriteRequestModel(
      productId: json["product_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
