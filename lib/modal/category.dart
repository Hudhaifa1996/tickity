class CategoryResponse {
  CategoryResponse({
    required this.categories,
    required this.status,
  });

  final List<Category> categories;
  final String? status;

  factory CategoryResponse.fromJson(Map<String, dynamic> json){
    return CategoryResponse(
      categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      status: json["status"],
    );
  }

}

class Category {
  Category({
    required this.order,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.events,
    required this.id,
    required this.isDeleted,
    required this.createAt,
    required this.updateAt,
  });

  final int? order;
  final String? name;
  final String? color;
  final String? iconUrl;
  final dynamic events;
  final String? id;
  final bool? isDeleted;
  final DateTime? createAt;
  final DateTime? updateAt;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      order: json["order"],
      name: json["name"],
      color: json["color"],
      iconUrl: json["iconUrl"],
      events: json["events"],
      id: json["id"],
      isDeleted: json["isDeleted"],
      createAt: DateTime.tryParse(json["createAt"] ?? ""),
      updateAt: DateTime.tryParse(json["updateAt"] ?? ""),
    );
  }

}
