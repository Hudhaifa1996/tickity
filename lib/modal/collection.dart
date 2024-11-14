class CollectionResponse {
  CollectionResponse({
    required this.collections,
    required this.status,
  });

  final List<Collection> collections;
  final String? status;

  factory CollectionResponse.fromJson(Map<String, dynamic> json){
    return CollectionResponse(
      collections: json["collections"] == null ? [] : List<Collection>.from(json["collections"]!.map((x) => Collection.fromJson(x))),
      status: json["status"],
    );
  }

}

class Collection {
  Collection({
    required this.name,
    required this.collectionType,
    required this.order,
    required this.id,
    required this.isDeleted,
    required this.createAt,
    required this.updateAt,
  });

  final String? name;
  final int? collectionType;
  final int? order;
  final String? id;
  final bool? isDeleted;
  final DateTime? createAt;
  final DateTime? updateAt;

  factory Collection.fromJson(Map<String, dynamic> json){
    return Collection(
      name: json["name"],
      collectionType: json["collectionType"],
      order: json["order"],
      id: json["id"],
      isDeleted: json["isDeleted"],
      createAt: DateTime.tryParse(json["createAt"] ?? ""),
      updateAt: DateTime.tryParse(json["updateAt"] ?? ""),
    );
  }

}
